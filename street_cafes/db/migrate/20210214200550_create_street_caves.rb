class CreateStreetCaves < ActiveRecord::Migration[5.2]
  def change
    create_table :street_cafes do |t|
      t.string :name
      t.string :address
      t.string :post_code
      t.integer :num_chairs
      t.string :note

      t.timestamps
    end
  end
end
