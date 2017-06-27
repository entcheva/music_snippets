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

ActiveRecord::Schema.define(version: 20170703182119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "activities", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "subject_id"
    t.string "subject_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.index ["subject_id"], name: "index_activities_on_subject_id"
    t.index ["subject_type"], name: "index_activities_on_subject_type"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "audio_files", id: :serial, force: :cascade do |t|
    t.string "artist"
    t.string "title"
    t.string "audio_file_name"
    t.string "audio_content_type"
    t.integer "audio_file_size"
    t.datetime "audio_updated_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_audio_files_on_user_id"
  end

  create_table "dashboards", id: :serial, force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "snippets", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "notes", default: ""
    t.integer "user_id"
    t.index ["user_id"], name: "index_snippets_on_user_id"
  end

  create_table "suggestions_job_statuses", force: :cascade do |t|
    t.string "message"
    t.hstore "payload"
    t.boolean "done", default: false, null: false
    t.string "jobid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "wishlists", id: :serial, force: :cascade do |t|
    t.string "artist"
    t.string "title"
    t.string "instrument"
    t.integer "user_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "activities", "users"
  add_foreign_key "audio_files", "users"
  add_foreign_key "snippets", "users"
  add_foreign_key "wishlists", "users"
end
