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

ActiveRecord::Schema.define(version: 2022_09_23_082821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "call_next_actions", force: :cascade do |t|
    t.string "next_action_option", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "call_result_primaries", force: :cascade do |t|
    t.string "result_primary_option", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "call_result_secondaries", force: :cascade do |t|
    t.string "result_secondary_option", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "call_results", primary_key: "call_id", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.bigint "call_result_primary_id", null: false
    t.bigint "call_result_secondary_id", null: false
    t.bigint "call_next_action_id", null: false
    t.datetime "next_action_date"
    t.string "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["call_next_action_id"], name: "index_call_results_on_call_next_action_id"
    t.index ["call_result_primary_id"], name: "index_call_results_on_call_result_primary_id"
    t.index ["call_result_secondary_id"], name: "index_call_results_on_call_result_secondary_id"
    t.index ["company_id"], name: "index_call_results_on_company_id"
    t.index ["user_id"], name: "index_call_results_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name_ja", limit: 128, default: "", null: false
    t.string "company_name_en", limit: 128, default: "", null: false
    t.string "company_name_noprefix", limit: 128, default: "", null: false
    t.text "address"
    t.string "representative", limit: 64, default: "", null: false
    t.string "listed_at", limit: 128, default: "", null: false
    t.bigint "capital"
    t.integer "founded_at", limit: 2
    t.text "page_url"
    t.bigint "profit"
    t.integer "number_of_employees"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "person_in_charges", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.string "account_source", limit: 64, default: "", null: false
    t.string "position", limit: 128
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_person_in_charges_on_company_id"
    t.index ["user_id"], name: "index_person_in_charges_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 64, default: "", null: false
    t.string "email", limit: 128, default: "", null: false
    t.string "password", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "call_results", "call_next_actions"
  add_foreign_key "call_results", "call_result_primaries"
  add_foreign_key "call_results", "call_result_secondaries"
  add_foreign_key "call_results", "companies"
  add_foreign_key "call_results", "users"
  add_foreign_key "person_in_charges", "companies"
  add_foreign_key "person_in_charges", "users"
end
