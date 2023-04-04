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

ActiveRecord::Schema[7.0].define(version: 2023_04_03_085006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "line_ups", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "politic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "result", default: 0
    t.bigint "team_id", null: false
    t.index ["match_id"], name: "index_line_ups_on_match_id"
    t.index ["politic_id"], name: "index_line_ups_on_politic_id"
    t.index ["team_id"], name: "index_line_ups_on_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.string "winner", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "statut", default: "Composition"
    t.date "date"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "politics", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "politic_board"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_matches", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "match_score", default: 0
    t.index ["match_id"], name: "index_team_matches_on_match_id"
    t.index ["team_id"], name: "index_team_matches_on_team_id"
  end

  create_table "team_politics", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "politic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["politic_id"], name: "index_team_politics_on_politic_id"
    t.index ["team_id"], name: "index_team_politics_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tournament_id", null: false
    t.string "name"
    t.integer "number_of_politics"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score", default: 0
    t.index ["tournament_id"], name: "index_teams_on_tournament_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.integer "final_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_tournaments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tournament_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_user_tournaments_on_tournament_id"
    t.index ["user_id"], name: "index_user_tournaments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "line_ups", "matches"
  add_foreign_key "line_ups", "politics"
  add_foreign_key "line_ups", "teams"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "team_matches", "matches"
  add_foreign_key "team_matches", "teams"
  add_foreign_key "team_politics", "politics"
  add_foreign_key "team_politics", "teams"
  add_foreign_key "teams", "tournaments"
  add_foreign_key "teams", "users"
  add_foreign_key "user_tournaments", "tournaments"
  add_foreign_key "user_tournaments", "users"
end
