class AddDietToDietaryPreference < ActiveRecord::Migration
  def change
  	add_reference :dietary_preferences, :diet, index: true
  	add_foreign_key :dietary_preferences, :diets
  end
end
