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

ActiveRecord::Schema[7.1].define(version: 2024_04_23_122321) do
  create_table "lessons", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.string "handout"
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
    t.index ["assistent_id"], name: "index_schedules_on_assistent_id"
    t.index ["leader_id"], name: "index_schedules_on_leader_id"
    t.index ["lesson_id"], name: "index_schedules_on_lesson_id"
    t.index ["teacher_id"], name: "index_schedules_on_teacher_id"
  end

  create_table "type_profiles", charset: "utf8mb3", force: :cascade do |t|
    t.string "description"
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
    t.integer "preferred_day"
    t.integer "preferred_class"
    t.boolean "assistent", default: false, null: false
    t.boolean "leader", default: false, null: false
  end

  add_foreign_key "schedules", "lessons"
  add_foreign_key "schedules", "users", column: "assistent_id"
  add_foreign_key "schedules", "users", column: "leader_id"
  add_foreign_key "schedules", "users", column: "teacher_id"
end
