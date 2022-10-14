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

ActiveRecord::Schema[7.0].define(version: 2022_10_12_105957) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", force: :cascade do |t|
    t.string "name", null: false, comment: "名前"
    t.bigint "customer_id", comment: "顧客ID"
    t.datetime "invalidated_at", precision: nil, comment: "論理削除時刻"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_avatars_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", null: false, comment: "メールアドレス"
    t.string "family_name", null: false, comment: "姓"
    t.string "given_name", null: false, comment: "名"
    t.string "hashed_password", comment: "パスワード"
    t.datetime "invalidated_at", precision: nil, comment: "論理削除時刻"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "lower((email)::text)", name: "index_customers_on_LOWER_email", unique: true
  end

  create_table "owned_skills", force: :cascade do |t|
    t.bigint "avatar_id", comment: "アバターID"
    t.bigint "skill_id", comment: "スキルID"
    t.integer "level", default: 1, null: false, comment: "レベル"
    t.integer "experience_point", default: 1, null: false, comment: "経験値"
    t.datetime "invalidated_at", precision: nil, comment: "論理削除時刻"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_owned_skills_on_avatar_id"
    t.index ["skill_id"], name: "index_owned_skills_on_skill_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "grade", null: false, comment: "難易度"
    t.datetime "invalidated_at", precision: nil, comment: "論理削除時刻"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false, comment: "スキル名"
    t.datetime "invalidated_at", precision: nil, comment: "論理削除時刻"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name", null: false, comment: "タスク名"
    t.integer "experience_point", default: 1, null: false, comment: "経験値"
    t.bigint "skill_id", comment: "スキルID"
    t.bigint "rank_id", comment: "ランクID"
    t.datetime "completed_at", precision: nil, comment: "完了時刻"
    t.datetime "invalidated_at", precision: nil, comment: "論理削除時刻"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rank_id"], name: "index_tasks_on_rank_id"
    t.index ["skill_id"], name: "index_tasks_on_skill_id"
  end

  add_foreign_key "avatars", "customers"
  add_foreign_key "owned_skills", "avatars"
  add_foreign_key "owned_skills", "skills"
  add_foreign_key "tasks", "ranks"
  add_foreign_key "tasks", "skills"
end
