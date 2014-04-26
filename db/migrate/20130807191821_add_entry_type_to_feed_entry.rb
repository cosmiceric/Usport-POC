class AddEntryTypeToFeedEntry < ActiveRecord::Migration
  def change
    add_column :feed_entries, :entry_type, :string, :default => 'photos'
  end
end
