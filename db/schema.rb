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

ActiveRecord::Schema.define(version: 20141010203257) do

  create_table "careers", force: true do |t|
    t.string "name"
  end

  add_index "careers", ["name"], name: "index_careers_on_name", using: :btree

  create_table "formulas", force: true do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "graduates", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "dni"
    t.string   "career_ids"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "graduates", ["deleted_at"], name: "index_graduates_on_deleted_at", using: :btree
  add_index "graduates", ["dni"], name: "index_graduates_on_dni", using: :btree

  create_table "inscriptions", force: true do |t|
    t.integer  "order"
    t.integer  "swear_id"
    t.integer  "formula_id"
    t.integer  "graduate_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operators", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "operators", ["email"], name: "index_operators_on_email", unique: true, using: :btree
  add_index "operators", ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true, using: :btree

  create_table "swears", force: true do |t|
    t.date     "inscription_date"
    t.date     "swear_date"
    t.integer  "quota"
    t.integer  "used_quota",       default: 0
    t.boolean  "enabled",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
