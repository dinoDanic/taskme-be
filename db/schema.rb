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

ActiveRecord::Schema[7.0].define(version: 2022_04_02_113513) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "priority", ["urgent", "high", "low", "none"]
  create_enum "priority_enum", ["urgent", "high", "low", "none"]
  create_enum "task_status_enum", ["completed", "open"]

  create_table "project_task_joins", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_task_joins_on_project_id"
    t.index ["task_id"], name: "index_project_task_joins_on_task_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "visibility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "project_name"
    t.string "assignee_name"
    t.enum "priority", default: "none", null: false, enum_type: "priority_enum"
    t.enum "status", default: "open", null: false, enum_type: "task_status_enum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.bigint "user_id"
    t.bigint "assignee_id"
    t.bigint "parent_id"
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id"
    t.index ["parent_id"], name: "index_tasks_on_parent_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "project_task_joins", "projects"
  add_foreign_key "project_task_joins", "tasks"
  add_foreign_key "projects", "users"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "tasks", column: "parent_id"
  add_foreign_key "tasks", "users"
  add_foreign_key "tasks", "users", column: "assignee_id"
end
