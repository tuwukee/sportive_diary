class DeviseCreatePlayers < ActiveRecord::Migration
  def change
    create_table(:players) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end

    add_index :players, :email,                :unique => true
    add_index :players, :reset_password_token, :unique => true
  end
end
