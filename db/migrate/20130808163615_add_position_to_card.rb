class AddPositionToCard < ActiveRecord::Migration
  def change
    add_column :cards, :position, :string
  end
end
