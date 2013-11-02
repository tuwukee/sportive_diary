class AddPlansToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :plan_id, :integer
  end
end
