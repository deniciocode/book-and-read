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

ActiveRecord::Schema.define(version: 20151202085129) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
  end

  create_table "book_ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "book_ownerships", ["book_id"], name: "index_book_ownerships_on_book_id"
  add_index "book_ownerships", ["user_id"], name: "index_book_ownerships_on_user_id"

  create_table "books", force: :cascade do |t|
    t.text    "title"
    t.text    "subtitle"
    t.string  "published_at"
    t.text    "description"
    t.string  "language"
    t.string  "image_link"
    t.integer "pages"
    t.string  "isbn"
    t.string  "isbn_13"
  end

  create_table "books_authors", force: :cascade do |t|
    t.integer "book_id"
    t.integer "author_id"
  end

  add_index "books_authors", ["author_id"], name: "index_books_authors_on_author_id"
  add_index "books_authors", ["book_id"], name: "index_books_authors_on_book_id"

  create_table "borrow_requests", force: :cascade do |t|
    t.integer  "requester_id"
    t.integer  "owner_id"
    t.date     "borrow_start"
    t.date     "borrow_end"
    t.integer  "book_id"
    t.integer  "place_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "places", force: :cascade do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "last_name"
    t.string   "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "rentals", force: :cascade do |t|
    t.date     "start"
    t.date     "end"
    t.integer  "owner_id"
    t.integer  "borrower_id"
    t.integer  "book_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
