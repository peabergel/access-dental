# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_12_17_151951) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "image_url"
    t.string "pre_content"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.string "image_url"
    t.string "primary_color"
    t.string "secondary_color"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands_categories", id: false, force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.bigint "category_id", null: false
    t.index ["brand_id", "category_id"], name: "index_brands_categories_on_brand_id_and_category_id"
    t.index ["category_id", "brand_id"], name: "index_brands_categories_on_category_id_and_brand_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "pdf_url"
    t.boolean "month_offer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "brand_id", null: false
    t.string "description"
    t.string "image_url"
    t.string "pdf_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "products", "brands"
end
