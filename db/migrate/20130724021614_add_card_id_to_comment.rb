class AddCardIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :card_id, :integer
  end
end
