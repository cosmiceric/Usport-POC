class AddFieldsToCard < ActiveRecord::Migration
  def change
    add_column :cards, :followers, :integer
    add_column :cards, :collection, :integer
    add_column :cards, :on_base_percentage, :decimal
    add_column :cards, :home_runs, :integer
    add_column :cards, :runs, :integer
    add_column :cards, :runs_batted_in, :integer
    add_column :cards, :stolen_bases, :integer
  end
end
