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

ActiveRecord::Schema[8.1].define(version: 2026_01_19_103006) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_actions", force: :cascade do |t|
    t.string "action"
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.json "metadata"
    t.integer "record_id"
    t.string "record_type"
    t.datetime "updated_at", null: false
    t.text "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_admin_actions_on_user_id"
  end

  create_table "broadcasts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "delivery_method", default: "in_app"
    t.string "delivery_type", default: "SMS", null: false
    t.string "image"
    t.text "message", null: false
    t.string "status", default: "Draft", null: false
    t.string "target_audience"
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.integer "ward_id"
  end

  create_table "citizen_submissions", force: :cascade do |t|
    t.text "admin_comment"
    t.string "anonymity"
    t.string "citizen_contact"
    t.datetime "created_at", null: false
    t.text "description", null: false
    t.boolean "flagged", default: false, null: false
    t.string "location"
    t.string "status", default: "submitted", null: false
    t.string "title", null: false
    t.string "topic"
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "community_idea_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["community_idea_id"], name: "index_comments_on_community_idea_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "community_ideas", force: :cascade do |t|
    t.text "admin_comment"
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "downvotes", default: 0
    t.string "status", default: "pending", null: false
    t.string "title"
    t.string "topic"
    t.datetime "updated_at", null: false
    t.integer "upvotes", default: 0
    t.integer "user_id"
    t.string "ward"
    t.index ["user_id"], name: "index_community_ideas_on_user_id"
  end

  create_table "planning_documents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "document_type"
    t.string "end_year"
    t.string "start_year"
    t.integer "status"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.integer "topic_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["topic_id"], name: "index_posts_on_topic_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "data"
    t.string "session_id", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "submissions", force: :cascade do |t|
    t.string "anonymity"
    t.string "citizen_contact"
    t.datetime "created_at", null: false
    t.text "description"
    t.boolean "is_anonymous"
    t.string "location"
    t.string "other_topic"
    t.string "sub_county"
    t.string "title"
    t.string "topic"
    t.datetime "updated_at", null: false
    t.string "ward"
  end

  create_table "topics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.integer "consumed_timestep"
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.boolean "otp_required_for_login"
    t.string "otp_secret"
    t.string "phone_number"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "timeout_at"
    t.boolean "timeoutable"
    t.boolean "trackable"
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "community_idea_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "vote_type", null: false
    t.index ["community_idea_id"], name: "index_votes_on_community_idea_id"
    t.index ["user_id", "community_idea_id"], name: "index_votes_on_user_id_and_community_idea_id", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  create_table "wards", force: :cascade do |t|
    t.string "constituency", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_actions", "users"
  add_foreign_key "broadcasts", "wards"
  add_foreign_key "comments", "community_ideas"
  add_foreign_key "comments", "users"
  add_foreign_key "community_ideas", "users"
  add_foreign_key "posts", "topics"
  add_foreign_key "posts", "users"
  add_foreign_key "topics", "users"
  add_foreign_key "votes", "community_ideas"
  add_foreign_key "votes", "users"
end
