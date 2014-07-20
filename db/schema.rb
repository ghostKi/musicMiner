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

ActiveRecord::Schema.define(version: 20140720012648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "summary"
    t.text     "body"
    t.string   "photo_path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.date     "published_at"
  end

  add_index "articles", ["source_id"], name: "index_articles_on_source_id", using: :btree

  create_table "sources", force: true do |t|
    t.string   "source_name"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end