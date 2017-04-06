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

ActiveRecord::Schema.define(version: 20170406192941) do

  create_table "laboratories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "laboratories", ["name"], name: "index_laboratories_on_name", unique: true

  create_table "labs", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "order_date"
    t.date     "collection_date"
    t.date     "report_date"
    t.string   "requesting_physician"
    t.integer  "laboratory_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "labs", ["laboratory_id"], name: "index_labs_on_laboratory_id"
  add_index "labs", ["user_id"], name: "index_labs_on_user_id"

  create_table "labs_panels", id: false, force: :cascade do |t|
    t.integer "lab_id",   null: false
    t.integer "panel_id", null: false
  end

  create_table "panels", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "panels_test_types", id: false, force: :cascade do |t|
    t.integer "panel_id",     null: false
    t.integer "test_type_id", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "gender",        limit: 1
    t.date     "date_of_birth"
    t.string   "ethnicity"
    t.string   "zip_code",      limit: 10
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "test_types", force: :cascade do |t|
    t.string   "name",                 null: false
    t.text     "description"
    t.float    "reference_range_low"
    t.float    "reference_range_high"
    t.integer  "unit_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "reference_type"
  end

  add_index "test_types", ["name"], name: "index_test_types_on_name", unique: true
  add_index "test_types", ["unit_id"], name: "index_test_types_on_unit_id"

  create_table "tests", force: :cascade do |t|
    t.integer  "lab_id"
    t.integer  "test_type_id"
    t.float    "value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tests", ["lab_id"], name: "index_tests_on_lab_id"
  add_index "tests", ["test_type_id"], name: "index_tests_on_test_type_id"

  create_table "units", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "units", ["name"], name: "index_units_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
