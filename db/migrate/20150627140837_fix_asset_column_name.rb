class FixAssetColumnName < ActiveRecord::Migration
  def change
    rename_column :assets, :type, :asset_type
  end
end
