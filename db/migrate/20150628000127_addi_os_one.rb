class AddiOsOne < ActiveRecord::Migration
  def change
    add_column :images, :ios, :integer
  end
end
