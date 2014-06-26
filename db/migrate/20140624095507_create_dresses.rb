class CreateDresses < ActiveRecord::Migration
  def change
    create_table :dresses do |t|
      t.string :name
      t.string :brand
      t.string :image
      t.string :price
      t.string :type
      t.string :color
      t.string :length

      t.timestamps
    end
  end
end
