class CreateFavouriteLists < ActiveRecord::Migration[6.0]
  def change
    create_table :favourite_lists do |t|
      t.datetime :date
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
