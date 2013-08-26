class DeviseCreateParents < ActiveRecord::Migration
  def change
    create_table(:parents) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end

    add_index :parents, :email,                :unique => true
    add_index :parents, :reset_password_token, :unique => true
  end
end
