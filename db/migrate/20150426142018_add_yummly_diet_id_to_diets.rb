class AddYummlyDietIdToDiets < ActiveRecord::Migration
  def change
    add_column :diets, :yummly_diet_id, :string
  end
end
