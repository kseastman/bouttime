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

ActiveRecord::Schema.define(version: 20150106111344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clock_states", force: true do |t|
    t.string   "display",    limit: 16
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time"
  end

  create_table "events", force: true do |t|
    t.json     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "role"
  end

  create_table "game_states", force: true do |t|
    t.integer  "state"
    t.integer  "jam_number"
    t.integer  "period_number"
    t.integer  "home_id"
    t.integer  "away_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "jam_clock_id"
    t.integer  "period_clock_id"
    t.integer  "timeout",         limit: 2
  end

  add_index "game_states", ["away_id"], name: "index_game_states_on_away_id", using: :btree
  add_index "game_states", ["home_id"], name: "index_game_states_on_home_id", using: :btree

  create_table "jam_states", force: true do |t|
    t.integer  "team_state_id"
    t.integer  "jam_number"
    t.string   "skater_number"
    t.integer  "points"
    t.boolean  "injury"
    t.boolean  "lead"
    t.boolean  "lost_lead"
    t.boolean  "calloff"
    t.boolean  "nopass"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_selected",   default: false
  end

  add_index "jam_states", ["team_state_id"], name: "index_jam_states_on_team_state_id", using: :btree

  create_table "jammer_states", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.boolean  "is_lead"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pass_states", force: true do |t|
    t.integer  "pass_number"
    t.string   "skater_number"
    t.integer  "points"
    t.boolean  "injury"
    t.boolean  "lead"
    t.boolean  "lost_lead"
    t.boolean  "calloff"
    t.boolean  "nopass"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "jam_state_id"
    t.boolean  "is_selected",   default: false
  end

  add_index "pass_states", ["jam_state_id"], name: "index_pass_states_on_jam_state_id", using: :btree

  create_table "team_states", force: true do |t|
    t.string   "name"
    t.string   "initials"
    t.text     "color_bar_style"
    t.integer  "points"
    t.boolean  "is_taking_official_review"
    t.boolean  "is_taking_timeout"
    t.integer  "timeouts"
    t.integer  "jammer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.integer  "official_reviews_retained", default: 0
    t.text     "logo"
    t.integer  "jam_points"
    t.boolean  "has_official_review"
    t.string   "text_color"
    t.boolean  "is_selected",               default: false
  end

  add_index "team_states", ["jammer_id"], name: "index_team_states_on_jammer_id", using: :btree

end
