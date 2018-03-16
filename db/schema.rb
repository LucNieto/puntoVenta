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

ActiveRecord::Schema.define(version: 20180315162314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bussines_names", force: :cascade do |t|
    t.string "nombre"
    t.string "rfc"
    t.string "direccion_fiscal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "bussines_name_id"
    t.string "nombre"
    t.string "direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bussines_name_id"], name: "index_companies_on_bussines_name_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "company_id"
    t.string "nombre"
    t.string "descripcion"
    t.integer "cantidad"
    t.float "precio_compra"
    t.float "precio_venta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  add_foreign_key "companies", "bussines_names"
  add_foreign_key "products", "companies"
end