class AddYummlyAllergyIdToAllergies < ActiveRecord::Migration
  def change
  	add_column :allergies, :yummly_allergy_id, :string
  end
end
