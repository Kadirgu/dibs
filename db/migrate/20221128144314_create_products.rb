class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :image
      t.string :title
      t.text :description
      t.string :condition
      t.string :material
      t.integer :price
      t.integer :dimension
      t.string :location
      t.boolean :spotted

      t.timestamps
    end
  end
end
