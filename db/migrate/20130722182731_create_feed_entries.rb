class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.text :content

      t.timestamps
    end
  end
end
