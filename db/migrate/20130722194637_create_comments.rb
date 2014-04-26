class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :feed_entry_id

      t.timestamps
    end
  end
end
