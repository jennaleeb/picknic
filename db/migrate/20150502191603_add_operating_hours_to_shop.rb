class AddOperatingHoursToShop < ActiveRecord::Migration
  def change
    add_column :shops, :operating_hours, :string
  end
end
