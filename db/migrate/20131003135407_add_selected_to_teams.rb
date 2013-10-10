class AddSelectedToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :selected, :boolean, :default => false
  end
end
