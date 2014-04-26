class UpdateOnBasePercentageInCard < ActiveRecord::Migration
  def change
    change_column :cards, :on_base_percentage, :decimal, :scale => 3, :precision => 10
  end
end
