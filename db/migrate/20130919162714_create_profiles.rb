class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :coach
      t.references :player
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.integer :gender_cd

      t.timestamps
    end
  end
end
