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

ActiveRecord::Schema.define(version: 20170608094229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artworks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "style_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_artworks_on_category_id", using: :btree
    t.index ["style_id"], name: "index_artworks_on_style_id", using: :btree
    t.index ["user_id"], name: "index_artworks_on_user_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.string   "status",        default: "pending"
    t.integer  "price_cents"
    t.integer  "user_id"
    t.integer  "exhibition_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["exhibition_id"], name: "index_bids_on_exhibition_id", using: :btree
    t.index ["user_id"], name: "index_bids_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exhibition_categories", force: :cascade do |t|
    t.integer  "exhibition_id"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_exhibition_categories_on_category_id", using: :btree
    t.index ["exhibition_id"], name: "index_exhibition_categories_on_exhibition_id", using: :btree
  end

  create_table "exhibition_styles", force: :cascade do |t|
    t.integer  "exhibition_id"
    t.integer  "style_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["exhibition_id"], name: "index_exhibition_styles_on_exhibition_id", using: :btree
    t.index ["style_id"], name: "index_exhibition_styles_on_style_id", using: :btree
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string   "title"
    t.string   "address"
    t.text     "description"
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "min_price_cents"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "duration"
    t.integer  "price_cents"
    t.index ["user_id"], name: "index_exhibitions_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "state"
    t.string   "artist_name"
    t.integer  "amount_cents",  default: 0, null: false
    t.json     "payment"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "exhibition_id"
    t.index ["exhibition_id"], name: "index_orders_on_exhibition_id", using: :btree
  end

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "company_name"
    t.boolean  "is_company"
    t.text     "description"
    t.string   "address"
    t.date     "birthday"
    t.string   "website"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "artworks", "categories"
  add_foreign_key "artworks", "styles"
  add_foreign_key "artworks", "users"
  add_foreign_key "bids", "exhibitions"
  add_foreign_key "bids", "users"
  add_foreign_key "exhibition_categories", "categories"
  add_foreign_key "exhibition_categories", "exhibitions"
  add_foreign_key "exhibition_styles", "exhibitions"
  add_foreign_key "exhibition_styles", "styles"
  add_foreign_key "exhibitions", "users"
  add_foreign_key "orders", "exhibitions"
end
