class ChangeAccessoryTable < ActiveRecord::Migration
  def change
    add_column :accessories, :x, :y, :width, :height 
  end
end
