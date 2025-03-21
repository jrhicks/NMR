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

ActiveRecord::Schema[7.0].define(version: 2022_11_16_175726) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.bigint "user_id"
    t.string "status"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "report_id", null: false
    t.string "task"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_notes_on_report_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.bigint "location_id", null: false
    t.bigint "category_id", null: false
    t.string "corrective_action"
    t.string "final_action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending_corrective_action"
    t.index ["category_id"], name: "index_reports_on_category_id"
    t.index ["location_id"], name: "index_reports_on_location_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "phone"
    t.string "title"
    t.string "avitar"
    t.string "avatar"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "notes", "reports"
  add_foreign_key "notes", "users"
  add_foreign_key "reports", "categories"
  add_foreign_key "reports", "locations"
  add_foreign_key "reports", "users"
end
