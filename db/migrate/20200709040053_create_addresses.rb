class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :district
      t.string :state
      t.integer :pincode
      t.string :near_by_place
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
