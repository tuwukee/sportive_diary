class AddPlansToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :plan_id, :integer
  end
end
