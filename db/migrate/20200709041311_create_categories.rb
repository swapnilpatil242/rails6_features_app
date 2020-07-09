class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.string :picture

      t.timestamps
    end
    add_index :categories, :title
  end
end
