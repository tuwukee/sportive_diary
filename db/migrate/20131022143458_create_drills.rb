class CreateDrills < ActiveRecord::Migration
  def change
    create_table :drills do |t|
      t.references :plan, :null => false
      t.string :name
      t.integer :repetitions

      t.timestamps
    end
  end
end
