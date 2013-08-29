class CreateTeams < ActiveRecord::Migration
  def change
    create_table(:teams) do |t|
      t.string :name, :null => false, :default => ""
      t.text :description, :default => ""
      t.integer :coach_id, :null => false

      t.timestamps
    end

    add_column :players, :team_id, :integer
  end
end
