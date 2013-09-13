class AddCodesToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :code, :string
  end
end
