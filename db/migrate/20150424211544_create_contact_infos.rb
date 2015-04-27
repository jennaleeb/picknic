class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.references :shop, index: true
      t.string :telephone_number
      t.string :fax_number

      t.timestamps null: false
    end
    add_foreign_key :contact_infos, :shops
  end
end
