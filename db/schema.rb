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

ActiveRecord::Schema.define(version: 2021_02_28_014929) do

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "etudes", force: :cascade do |t|
    t.string "book"
    t.integer "number"
    t.string "composer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "excerpts", force: :cascade do |t|
    t.string "work"
    t.string "composer"
    t.date "year_composed"
    t.string "composer_dates"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "longtones", force: :cascade do |t|
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.string "title"
    t.string "composer"
    t.date "year_composed"
    t.string "composer_dates"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recordings", force: :cascade do |t|
    t.bigint "session_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_recordings_on_session_id"
  end

  create_table "scales", force: :cascade do |t|
    t.string "note"
    t.string "quality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scjoins", force: :cascade do |t|
    t.bigint "session_id", null: false
    t.bigint "scale_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scale_id"], name: "index_scjoins_on_scale_id"
    t.index ["session_id"], name: "index_scjoins_on_session_id"
  end

  create_table "sejoins", force: :cascade do |t|
    t.bigint "session_id", null: false
    t.bigint "etude_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["etude_id"], name: "index_sejoins_on_etude_id"
    t.index ["session_id"], name: "index_sejoins_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.date "date"
    t.integer "duration"
    t.integer "focus_rating"
    t.integer "prod_rating"
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "sljoins", force: :cascade do |t|
    t.bigint "session_id", null: false
    t.bigint "longtone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["longtone_id"], name: "index_sljoins_on_longtone_id"
    t.index ["session_id"], name: "index_sljoins_on_session_id"
  end

  create_table "spjoins", force: :cascade do |t|
    t.bigint "session_id", null: false
    t.bigint "piece_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["piece_id"], name: "index_spjoins_on_piece_id"
    t.index ["session_id"], name: "index_spjoins_on_session_id"
  end

  create_table "sxjoins", force: :cascade do |t|
    t.bigint "session_id", null: false
    t.bigint "excerpt_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["excerpt_id"], name: "index_sxjoins_on_excerpt_id"
    t.index ["session_id"], name: "index_sxjoins_on_session_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "instrument"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "recordings", "sessions"
  add_foreign_key "scjoins", "scales"
  add_foreign_key "scjoins", "sessions"
  add_foreign_key "sejoins", "etudes"
  add_foreign_key "sejoins", "sessions"
  add_foreign_key "sessions", "users"
  add_foreign_key "sljoins", "longtones"
  add_foreign_key "sljoins", "sessions"
  add_foreign_key "spjoins", "pieces"
  add_foreign_key "spjoins", "sessions"
  add_foreign_key "sxjoins", "excerpts"
  add_foreign_key "sxjoins", "sessions"
end
