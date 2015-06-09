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

ActiveRecord::Schema.define(version: 20150609022216) do

  create_table "exams", force: :cascade do |t|
    t.string   "title"
    t.date     "expires_on"
    t.integer  "time_limit"
    t.integer  "item_quantity"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "exams", ["user_id"], name: "index_exams_on_user_id"

  create_table "item_answers", force: :cascade do |t|
    t.integer  "option_number"
    t.integer  "user_answer"
    t.boolean  "correct"
    t.integer  "solved_exam_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "item_answers", ["solved_exam_id"], name: "index_item_answers_on_solved_exam_id"

  create_table "items", force: :cascade do |t|
    t.string   "question"
    t.string   "option_1"
    t.string   "option_2"
    t.string   "option_3"
    t.string   "option_4"
    t.string   "option_5"
    t.integer  "correct_option"
    t.integer  "item_number"
    t.integer  "exam_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "items", ["exam_id"], name: "index_items_on_exam_id"

  create_table "solved_exams", force: :cascade do |t|
    t.boolean  "finished"
    t.integer  "score"
    t.integer  "correct_answers"
    t.integer  "user_id"
    t.integer  "exam_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "solved_exams", ["exam_id"], name: "index_solved_exams_on_exam_id"
  add_index "solved_exams", ["user_id"], name: "index_solved_exams_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "fullname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
