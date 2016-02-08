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

ActiveRecord::Schema.define(version: 20160207223305) do

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "fullname"
    t.string   "password"
    t.string   "auth_secret"
    t.datetime "last_seen"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "gauth_secret"
    t.string   "gauth_enabled",          default: "f"
    t.string   "gauth_tmp"
    t.datetime "gauth_tmp_datetime"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "superadmin",             default: false, null: false
    t.boolean  "approved",               default: false, null: false
  end

  add_index "admins", ["approved"], name: "index_admins_on_approved"
  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id"
  add_index "categorizations", ["project_id"], name: "index_categorizations_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.string   "status"
    t.date     "last_updated"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "featured_status",    default: 0
  end

end
