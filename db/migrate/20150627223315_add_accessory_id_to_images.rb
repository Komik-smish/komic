class AddAccessoryIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :accessory_id
  end
end
