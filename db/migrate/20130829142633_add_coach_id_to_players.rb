class AddCoachIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :coach_id, :integer
  end
end
