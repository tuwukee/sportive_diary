class AddCouchIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :couch_id, :integer
  end
end
