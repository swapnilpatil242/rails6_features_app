class CreatePaymentMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_methods do |t|
      t.string :payment_type, null: false, comment: 'card/upi/net'
      t.integer :card_no
      t.string :card_name
      t.string :upi_address
      t.integer :account_no
      t.string :account_name
      t.string :account_bank
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
