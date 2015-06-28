class CreateStrips < ActiveRecord::Migration
  def change
    create_table :strips do |t|
      t.string :name
      t.string :strip_url

      t.timestamps null: false
    end
  end
end
