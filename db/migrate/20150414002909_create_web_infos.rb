class CreateWebInfos < ActiveRecord::Migration
  def change
    create_table :web_infos do |t|
      t.string :email
      t.string :website
      t.string :facebook
      t.string :twitter
      t.references :shop, index: true

      t.timestamps null: false
    end
    add_foreign_key :web_infos, :shops
  end
end
