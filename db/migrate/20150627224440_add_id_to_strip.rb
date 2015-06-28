class AddIdToStrip < ActiveRecord::Migration
  def change
    add_column :images, :strip_id, :integer
  end
end
