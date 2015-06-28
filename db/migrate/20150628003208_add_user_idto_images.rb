class AddUserIdtoImages < ActiveRecord::Migration
  def change
    add_column :images, :user_id, :string
  end
end
