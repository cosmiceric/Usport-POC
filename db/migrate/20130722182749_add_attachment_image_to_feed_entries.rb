class AddAttachmentImageToFeedEntries < ActiveRecord::Migration
  def self.up
    change_table :feed_entries do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :feed_entries, :image
  end
end
