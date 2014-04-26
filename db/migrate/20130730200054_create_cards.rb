class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :first_name
      t.string :last_name
      t.integer :team_id
      t.date :date_of_birth
      t.string :height
      t.integer :weight
      t.string :jersey_number
      t.string :throws
      t.string :bats

      t.timestamps
    end
  end
end
