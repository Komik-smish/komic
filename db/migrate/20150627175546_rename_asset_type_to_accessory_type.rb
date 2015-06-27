class RenameAssetTypeToAccessoryType < ActiveRecord::Migration
  def change
    rename_column :accessories, :asset_type, :accessory_type
    rename_column :accessories, :asset_url, :accessory_url
  end
end
