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

ActiveRecord::Schema.define(version: 20140211034552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer "submission_id"
    t.text    "body"
  end

  add_index "comments", ["submission_id"], name: "index_comments_on_submission_id", using: :btree

  create_table "submissions", force: true do |t|
    t.text    "url"
    t.text    "title"
    t.integer "user_id"
    t.text    "text_block"
  end

  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

end
