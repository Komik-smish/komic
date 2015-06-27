class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :type
      t.string :name
      t.string :asset_url

      t.timestamps null: false
    end
  end
end
