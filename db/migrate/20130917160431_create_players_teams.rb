class CreatePlayersTeams < ActiveRecord::Migration
  def self.up
    create_table :players_teams, :id => false do |t|

      t.references :player, :null => false
      t.references :team, :null => false

    end
    remove_column :players, :team_id

    add_index :players_teams, [:player_id, :team_id], :unique => true
    add_index :players_teams, :player_id
  end

  def self.down
    drop_table :players_teams
    add_column :players, :team_id, :integer
  end
end
