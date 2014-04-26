class UpdateCollectionInCard < ActiveRecord::Migration
  def change
    rename_column :cards, :collection, :collected
  end
end
