class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.references :coach, :null => false
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
