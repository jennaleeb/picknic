class CreateUserAllergies < ActiveRecord::Migration
  def change
    create_table :user_allergies do |t|
      t.references :user, index: true
      t.references :allergy, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_allergies, :users
    add_foreign_key :user_allergies, :allergies
  end
end
