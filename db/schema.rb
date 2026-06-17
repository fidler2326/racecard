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

ActiveRecord::Schema[8.1].define(version: 2026_06_17_160827) do
  create_table "cards", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.date "race_date", default: -> { "curdate()" }, null: false
    t.datetime "updated_at", null: false
  end

  create_table "legs", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.integer "pool_id"
    t.integer "race_id"
    t.datetime "updated_at", null: false
  end

  create_table "pools", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.string "currency"
    t.integer "first_race_number"
    t.decimal "odds", precision: 10
    t.string "pool_code"
    t.string "status"
    t.decimal "total", precision: 10
    t.string "tote"
    t.datetime "updated_at", null: false
  end

  create_table "races", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "number"
    t.datetime "time"
    t.datetime "updated_at", null: false
  end

  create_table "runners", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.integer "finish_position"
    t.boolean "finished", default: false
    t.string "jockey"
    t.string "name"
    t.integer "number"
    t.decimal "odds", precision: 18, scale: 8, default: "0.0"
    t.string "program_number"
    t.integer "race_id"
    t.boolean "scratched", default: false
    t.string "trainer"
    t.datetime "updated_at", null: false
  end
end
