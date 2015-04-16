class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code
      t.references :shop, index: true

      t.timestamps null: false
    end
    add_foreign_key :addresses, :shops
  end
end
