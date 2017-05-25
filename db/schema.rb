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

ActiveRecord::Schema.define(version: 20170524234129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "peoples_id"
    t.index ["peoples_id"], name: "index_favourites_on_peoples_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "peoples", force: :cascade do |t|
    t.string "name"
    t.integer "height"
    t.string "skin_colour"
    t.string "eye_colour"
    t.string "gender"
    t.string "species_api"
    t.bigint "planet_id"
    t.bigint "race_id"
    t.string "api_url"
    t.index ["planet_id"], name: "index_peoples_on_planet_id"
    t.index ["race_id"], name: "index_peoples_on_race_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "climate"
    t.string "terrain"
    t.string "api_url"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.string "designation"
    t.string "api_url"
  end

  create_table "starships", force: :cascade do |t|
    t.text "name"
    t.text "model"
    t.text "starship_class"
    t.string "pilot"
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "password_digest"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.integer "cost_in_credit"
    t.integer "max_atmosphering_speed"
    t.string "api_url"
    t.string "pilot"
  end

  add_foreign_key "favourites", "peoples", column: "peoples_id"
  add_foreign_key "favourites", "users"
  add_foreign_key "peoples", "planets"
  add_foreign_key "peoples", "races"
end
