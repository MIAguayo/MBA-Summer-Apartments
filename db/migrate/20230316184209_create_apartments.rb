class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.integer :city_id
      t.string :city_name
      t.string :address
      t.string :status
      t.date :from_date
      t.date :to_date
      t.integer :price
      t.boolean :utilities_included
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :pet_friendly
      t.text :description
      t.integer :owner_id
      t.string :owner_name
      t.string :owner_email

      t.timestamps
    end
  end
end
