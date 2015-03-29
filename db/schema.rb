<<<<<<< HEAD
# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150329220141) do

  create_table "ingredient_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "ingredient_type_id"
  end

  add_index "ingredients", ["ingredient_type_id"], name: "index_ingredients_on_ingredient_type_id"

  create_table "recipe_ingredient_quantities", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.decimal  "quantity"
    t.string   "quantity_unit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "recipe_ingredient_quantities", ["ingredient_id"], name: "index_recipe_ingredient_quantities_on_ingredient_id"
  add_index "recipe_ingredient_quantities", ["recipe_id"], name: "index_recipe_ingredient_quantities_on_recipe_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "instructions"
    t.integer  "prep_time"
    t.string   "meal_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shopping_list_items", force: :cascade do |t|
    t.boolean  "done"
    t.integer  "shopping_list_id"
    t.integer  "recipe_ingredient_quantity_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "shopping_list_items", ["recipe_ingredient_quantity_id"], name: "index_shopping_list_items_on_recipe_ingredient_quantity_id"
  add_index "shopping_list_items", ["shopping_list_id"], name: "index_shopping_list_items_on_shopping_list_id"

  create_table "shopping_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

end
=======
# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150328232456) do

  create_table "ingredient_availabilities", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "month_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "ingredient_availabilities", ["ingredient_id"], name: "index_ingredient_availabilities_on_ingredient_id"
  add_index "ingredient_availabilities", ["month_id"], name: "index_ingredient_availabilities_on_month_id"

  create_table "ingredient_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "ingredient_type_id"
  end

  add_index "ingredients", ["ingredient_type_id"], name: "index_ingredients_on_ingredient_type_id"

  create_table "months", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredient_quantities", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.decimal  "quantity"
    t.string   "quantity_unit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "recipe_ingredient_quantities", ["ingredient_id"], name: "index_recipe_ingredient_quantities_on_ingredient_id"
  add_index "recipe_ingredient_quantities", ["recipe_id"], name: "index_recipe_ingredient_quantities_on_recipe_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "instructions"
    t.integer  "prep_time"
    t.string   "meal_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
>>>>>>> 2400a6070069deb013b8bd575f86a6a22b3dd267
