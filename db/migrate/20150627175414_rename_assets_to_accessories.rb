class RenameAssetsToAccessories < ActiveRecord::Migration
  def change
    rename_table :assets, :accessories
  end
end
