class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.string :org_number
      t.string :status, null: false, comment: 'processing/shipping/delivered/rejected'
      t.integer :quantity
      t.integer :price
      t.integer :discount
      t.text :status_comment
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :payment_method, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
    add_index :orders, :date
    add_index :orders, :status
  end
end
