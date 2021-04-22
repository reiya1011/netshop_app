# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_20_063006) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "buy_infos", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "u_info_id", null: false
    t.integer "sent", default: 0
    t.integer "quantity", default: 1
    t.boolean "shipping", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_buy_infos_on_item_id"
    t.index ["u_info_id"], name: "index_buy_infos_on_u_info_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "item_id", null: false
    t.integer "count", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
  end

  create_table "cart_quantities", force: :cascade do |t|
    t.integer "cart_item_id", null: false
    t.integer "quantity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_item_id"], name: "index_cart_quantities_on_cart_item_id"
    t.index ["quantity_id"], name: "index_cart_quantities_on_quantity_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "subject"
    t.text "contents"
    t.boolean "check", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "history_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_history_items_on_cart_id"
    t.index ["item_id"], name: "index_history_items_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.integer "price"
    t.integer "stocks", default: 0
    t.string "gender"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_likes_on_item_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "u_infos", force: :cascade do |t|
    t.string "name"
    t.string "postal_code"
    t.string "phone_number"
    t.string "prefectures"
    t.string "municipal_district"
    t.string "street_bunch"
    t.string "building_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_infos", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "u_info_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_user_infos_on_cart_id"
    t.index ["u_info_id"], name: "index_user_infos_on_u_info_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "buy_infos", "items"
  add_foreign_key "buy_infos", "u_infos"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "items"
  add_foreign_key "cart_quantities", "cart_items"
  add_foreign_key "cart_quantities", "quantities"
  add_foreign_key "carts", "users"
  add_foreign_key "history_items", "carts"
  add_foreign_key "history_items", "items"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
  add_foreign_key "user_infos", "carts"
  add_foreign_key "user_infos", "u_infos"
end
