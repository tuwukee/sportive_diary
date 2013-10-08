class AddSelectedToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :selected, :boolean
  end
end
