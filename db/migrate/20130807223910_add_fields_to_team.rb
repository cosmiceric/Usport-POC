class AddFieldsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :next_match_team_id, :integer
    add_column :teams, :next_game_at, :datetime
    add_column :teams, :wins, :integer
    add_column :teams, :losses, :integer
  end
end
