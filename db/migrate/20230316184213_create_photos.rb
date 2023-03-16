class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :photo_url
      t.integer :apartment_id

      t.timestamps
    end
  end
end
