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

ActiveRecord::Schema.define(version: 20150830135115) do

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "total_viewed"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.text     "description"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.string   "title"
    t.string   "slug"
    t.float    "score"
    t.float    "price"
    t.float    "features"
    t.float    "support"
    t.text     "short_description"
    t.text     "first_paragraph"
    t.text     "second_paragraph"
    t.text     "third_paragraph"
    t.text     "top_features"
    t.float    "lowest_price"
    t.text     "image"
    t.text     "url"
    t.integer  "total_viewed"
    t.string   "is_published"
    t.string   "is_featured"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "reviews", ["category_id"], name: "index_reviews_on_category_id"
  add_index "reviews", ["sub_category_id"], name: "index_reviews_on_sub_category_id"

  create_table "sites", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "next_url"
    t.string   "image"
    t.text     "meta_tags"
    t.text     "analytics"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.integer  "total_viewed"
    t.text     "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id"

  create_table "subs", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_id"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subs", ["category_id"], name: "index_subs_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
