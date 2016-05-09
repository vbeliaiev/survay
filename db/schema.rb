# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160509183834) do

  create_table "attempts", force: :cascade do |t|
    t.integer  "quiz_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "attempts", ["quiz_id"], name: "index_attempts_on_quiz_id", using: :btree
  add_index "attempts", ["user_id"], name: "index_attempts_on_user_id", using: :btree

  create_table "compares", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "type",       limit: 4
    t.integer  "quiz_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "questions", ["quiz_id"], name: "index_questions_on_quiz_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.integer  "status",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "selected_variants", force: :cascade do |t|
    t.integer  "attempt_id",  limit: 4
    t.integer  "question_id", limit: 4
    t.integer  "variant_id",  limit: 4
    t.integer  "compare_id",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "selected_variants", ["attempt_id"], name: "index_selected_variants_on_attempt_id", using: :btree
  add_index "selected_variants", ["compare_id"], name: "index_selected_variants_on_compare_id", using: :btree
  add_index "selected_variants", ["question_id"], name: "index_selected_variants_on_question_id", using: :btree
  add_index "selected_variants", ["variant_id"], name: "index_selected_variants_on_variant_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "email",            limit: 255, null: false
    t.string   "crypted_password", limit: 255
    t.string   "salt",             limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "variants", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.boolean  "correct",                 default: false
    t.integer  "question_id", limit: 4
    t.integer  "compare_id",  limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "variants", ["compare_id"], name: "index_variants_on_compare_id", using: :btree
  add_index "variants", ["question_id"], name: "index_variants_on_question_id", using: :btree

  add_foreign_key "attempts", "quizzes"
  add_foreign_key "attempts", "users"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "selected_variants", "attempts"
  add_foreign_key "selected_variants", "compares"
  add_foreign_key "selected_variants", "questions"
  add_foreign_key "selected_variants", "variants"
  add_foreign_key "variants", "compares"
  add_foreign_key "variants", "questions"
end
