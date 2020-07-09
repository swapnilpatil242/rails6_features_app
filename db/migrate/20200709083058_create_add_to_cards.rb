class CreateAddToCards < ActiveRecord::Migration[6.0]
  def change
    create_table :add_to_cards do |t|
      t.datetime :date
      t.string :quantity
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
