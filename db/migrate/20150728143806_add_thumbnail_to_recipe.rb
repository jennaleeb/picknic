class AddThumbnailToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :thumbnail, :string
  end
end
