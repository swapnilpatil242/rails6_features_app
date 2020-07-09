class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.integer :price
      t.string :picture
      t.boolean :is_active
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :quantity
    add_index :products, :is_active
  end
end
