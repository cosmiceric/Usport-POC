load 'deploy/assets'
require 'bundler/capistrano'


role :web, "vps114.speedyrails.ca"
role :app, "vps114.speedyrails.ca"
role :db,  "vps114.speedyrails.ca", :primary => true
set :application, "usport"

set :repository, "git@github.com:qmclaugh/usport.git"

set :normalize_asset_timestamps, false

set(:deploy_to) { "/var/www/apps/#{application}" }

set :user, "deploy"
set :password, ""
set :group, "www-data"

set :deploy_via, :remote_cache
set :scm, "git"
set :keep_releases, 5

after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"
after "deploy:finalize_update", "deploy:symlink_configs"  #, "deploy:symlink_custom"

namespace :deploy do

  # namespace :assets do
  #   task :precompile, :roles => :web, :except => { :no_release => true } do
  #     from = source.next_revision(current_revision)
  #     if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
  #       run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
  #     else
  #       logger.info "Skipping asset pre-compilation because there were no asset changes"
  #     end
  #   end
  # end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{deploy_to}/#{shared_dir}/tmp/restart.txt"
  end

  desc "Tasks to execute after code update"
  task :symlink_configs, :roles => [:app] do
    run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
    run "if [ -d #{release_path}/tmp ]; then rm -rf #{release_path}/tmp; fi; ln -nfs #{deploy_to}/#{shared_dir}/tmp #{release_path}/tmp"
  end

  desc "Custom Symlinks"
  task :symlink_custom, :roles => [:app] do
  end

end

desc "tail log"
task :plog do
  run "tail -f #{deploy_to}/current/log/production.log"
end

desc "tail log"
task :slog do
  run "tail -f #{deploy_to}/current/log/staging.log"
end

desc "Remote console" 
task :console, :roles => :app do
  server = find_servers(:roles => [:app]).first
  # if server.to_s.include?('vps114')
  #   env = 'staging'
  # else
    env = 'production'
  # end
  server = find_servers(:roles => [:app]).first
  run_with_tty server, "RAILS_ENV=#{env} bundle exec rails c"
end

desc "Remote bash" 
task :bash, :roles => :app do
  server = find_servers(:roles => [:app]).first
  run_with_tty server, %W( bash )
end

desc "Remote dbconsole" 
task :dbconsole, :roles => :app do
  env = :stage || "production"
  server = find_servers(:roles => [:app]).first
  run_with_tty server, %W( ./script/rails dbconsole #{env} )
end

def run_with_tty(server, cmd)
  # looks like total pizdets
  command = []
  command += %W( ssh -t #{gateway} -l #{self[:gateway_user] || self[:user]} ) if self[:gateway]
  command += %W( ssh -t )
  command += %W( -p #{server.port}) if server.port
  command += %W( -l #{user} #{server.host} )
  command += %W( cd #{current_path} )
  # have to escape this once if running via double ssh
  command += [self[:gateway] ? '\&\&' : '&&']
  command += Array(cmd)
  puts password
  system *command
end

desc "Load production data into development database"
task :download_db do

  env = "production"

  dbhost = "127.0.0.1"
  dbuser = 'usport'
  dbpassword =''
  
  application_db = "usport"
  local_db_host = "localhost"
  local_db_user = "root"
  local_db_password = nil
  local_db = "usport_dev"
  filename = "dump.#{Time.now.strftime '%Y-%m-%d_%H:%M:%S'}.sql"


  on_rollback do
    delete "/tmp/#{filename}"
    delete "/tmp/#{filename}.gz"
  end

  cmd = "mysqldump --opt --compress -u #{dbuser} --password=#{dbpassword} 
   --host=#{dbhost} #{application_db} > /tmp/#{filename}"
  puts "Dumping remote database"
  run(cmd) do |channel, stream, data|
    puts data
  end

  # compress the file on the server
  puts "Compressing remote data"
  run "gzip -9 /tmp/#{filename}"
  puts "Fetching remote data"
  get "/tmp/#{filename}.gz", "tmp/dump.sql.gz"

  # build the import command
  # no --password= needed if password is nil.
  if local_db_password.nil?
    cmd = "mysql -u #{local_db_user} #{local_db} < tmp/dump.sql"
  else
    cmd = "mysql -u #{local_db_user} --password=#{local_db_password} 
    #{local_db} < tmp/dump.sql"
  end
  
  # back up existing database
  puts "Backing up existing local database to tmp/#{local_db}_bak.sql"
  `rm -f tmp/#{local_db}_bak.sql`
  `mysqldump -u  #{local_db_user} #{local_db} > tmp/#{local_db}_bak.sql`

  # unzip the file. Can't use exec() for some reason so backticks will do
  puts "Uncompressing dump"
  `gzip -d tmp/dump.sql.gz`
  puts "Executing : #{cmd}"
  `#{cmd}`
  puts "Renaming dump file to #{filename}"
  `mv tmp/dump.sql tmp/#{filename}`
  # puts "Cleaning up"
  # `rm -f tmp/dump.sql`
end

desc "Copy Paperclip images down"
task :download_images, :roles => :app do
  `rm -rf public/system_bak`
  `mv public/system public/system_bak`
  download("#{deploy_to}/current/public/system/", "public/", :via=> :scp, :recursive=> true)
end

