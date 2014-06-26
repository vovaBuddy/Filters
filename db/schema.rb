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

ActiveRecord::Schema.define(version: 20140626033039) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", force: true do |t|
    t.string   "name"
    t.integer  "dress_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colors", ["dress_id"], name: "index_colors_on_dress_id", using: :btree

  create_table "dress_types", force: true do |t|
    t.string   "name"
    t.integer  "dress_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dress_types", ["dress_id"], name: "index_dress_types_on_dress_id", using: :btree

  create_table "dresses", force: true do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "image"
    t.string   "price"
    t.string   "type"
    t.string   "color"
    t.string   "length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lengths", force: true do |t|
    t.string   "name"
    t.integer  "dress_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lengths", ["dress_id"], name: "index_lengths_on_dress_id", using: :btree

end
