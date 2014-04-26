class AddApprovedToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :approved, :boolean
    add_column :investors, :admin, :boolean
  end
end
