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

ActiveRecord::Schema.define(version: 2022_05_14_102457) do

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

  create_table "documents", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number"
    t.bigint "user_id"
    t.string "status"
    t.string "doc_type"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "topic", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.boolean "execution"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "step_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["step_id"], name: "index_participants_on_step_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "route_name"
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "document_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_id"], name: "index_routes_on_document_id"
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "step_type"
    t.string "status"
    t.bigint "route_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "condition1"
    t.string "condition2"
    t.bigint "user_id"
    t.integer "number"
    t.integer "next_step1"
    t.integer "next_step2"
    t.index ["route_id"], name: "index_steps_on_route_id"
    t.index ["user_id"], name: "index_steps_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "number"
    t.string "description"
    t.datetime "end_date"
    t.datetime "completation_date"
    t.bigint "user_id", null: false
    t.bigint "goal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goal_id"], name: "index_tasks_on_goal_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["login"], name: "index_users_on_login", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "documents", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "participants", "steps"
  add_foreign_key "participants", "users"
  add_foreign_key "routes", "documents"
  add_foreign_key "routes", "users"
  add_foreign_key "steps", "routes"
  add_foreign_key "steps", "users"
  add_foreign_key "tasks", "goals"
  add_foreign_key "tasks", "users"
end
