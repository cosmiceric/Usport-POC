class AddAttachmentLogoToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :teams, :logo
  end
end
