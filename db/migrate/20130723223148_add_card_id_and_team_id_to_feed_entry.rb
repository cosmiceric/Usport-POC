class AddCardIdAndTeamIdToFeedEntry < ActiveRecord::Migration
  def change
    add_column :feed_entries, :card_id, :integer
    add_column :feed_entries, :team_id, :integer
  end
end
