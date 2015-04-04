class CreateDietaryPreferences < ActiveRecord::Migration
  def change
    create_table :dietary_preferences do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :dietary_preferences, :users
  end
end
