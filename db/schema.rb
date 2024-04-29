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

ActiveRecord::Schema[7.1].define(version: 2024_04_29_165803) do
  create_table "friendly_id_slugs", charset: "utf8mb3", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, length: { slug: 70, scope: 70 }
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", length: { slug: 140 }
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "lessons", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.string "handout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferred_classes", charset: "utf8mb3", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferred_days", charset: "utf8mb3", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", charset: "utf8mb3", force: :cascade do |t|
    t.string "teacher_name"
    t.bigint "teacher_id", null: false
    t.string "assistent_name"
    t.bigint "assistent_id", null: false
    t.string "leader_name"
    t.bigint "leader_id", null: false
    t.string "lesson_title"
    t.bigint "lesson_id", null: false
    t.string "stopover_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "assistent_leader_name"
    t.bigint "assistent_leader_id", null: false
    t.index ["assistent_id"], name: "index_schedules_on_assistent_id"
    t.index ["assistent_leader_id"], name: "index_schedules_on_assistent_leader_id"
    t.index ["leader_id"], name: "index_schedules_on_leader_id"
    t.index ["lesson_id"], name: "index_schedules_on_lesson_id"
    t.index ["teacher_id"], name: "index_schedules_on_teacher_id"
  end

  create_table "type_profiles", charset: "utf8mb3", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_preferred_classes", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_preferred_days", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "email"
    t.string "telefone"
    t.string "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "preferred_day"
    t.string "preferred_class"
    t.string "slug"
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "schedules", "lessons"
  add_foreign_key "schedules", "users", column: "assistent_id"
  add_foreign_key "schedules", "users", column: "assistent_leader_id"
  add_foreign_key "schedules", "users", column: "leader_id"
  add_foreign_key "schedules", "users", column: "teacher_id"
end
