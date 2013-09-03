class AddCodesToCouches < ActiveRecord::Migration
  def change
    add_column :couches, :code, :string
  end
end
