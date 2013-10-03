class AddCountriesToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :country, :string, :default => '', :null => false
    add_column :profiles, :city, :string, :default => '', :null => false
  end
end
