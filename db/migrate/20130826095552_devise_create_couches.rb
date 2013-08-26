class DeviseCreateCouches < ActiveRecord::Migration
  def change
    create_table(:couches) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end

    add_index :couches, :email,                :unique => true
    add_index :couches, :reset_password_token, :unique => true
  end
end
