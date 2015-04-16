class CreateOperatingHours < ActiveRecord::Migration
  def change
    create_table :operating_hours do |t|
      t.string :day_of_week
      t.time :start_time
      t.time :end_time
      t.boolean :is_weekend_hours
      t.references :shop, index: true

      t.timestamps null: false
    end
    add_foreign_key :operating_hours, :shops
  end
end
