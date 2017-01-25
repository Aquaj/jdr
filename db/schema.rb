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

ActiveRecord::Schema.define(version: 20170124190642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_abilities_on_parent_id", using: :btree
  end

  create_table "armours", force: :cascade do |t|
    t.string   "name"
    t.integer  "enc"
    t.string   "covers"
    t.integer  "armour_points"
    t.text     "details"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "availabilities", force: :cascade do |t|
    t.integer  "skillset_id"
    t.integer  "skill_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["skill_id"], name: "index_availabilities_on_skill_id", using: :btree
    t.index ["skillset_id"], name: "index_availabilities_on_skillset_id", using: :btree
  end

  create_table "awarenesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fact_id"], name: "index_awarenesses_on_fact_id", using: :btree
    t.index ["user_id"], name: "index_awarenesses_on_user_id", using: :btree
  end

  create_table "base_stats", force: :cascade do |t|
    t.integer  "stat_id"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stat_id"], name: "index_base_stats_on_stat_id", using: :btree
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.integer  "game_master_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["game_master_id"], name: "index_campaigns_on_game_master_id", using: :btree
    t.index ["group_id"], name: "index_campaigns_on_group_id", using: :btree
  end

  create_table "career_changes", force: :cascade do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "character_id"
    t.string   "reason"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["character_id"], name: "index_career_changes_on_character_id", using: :btree
    t.index ["from_id"], name: "index_career_changes_on_from_id", using: :btree
    t.index ["to_id"], name: "index_career_changes_on_to_id", using: :btree
  end

  create_table "careers", force: :cascade do |t|
    t.integer  "stat_bonus_set_id"
    t.string   "name"
    t.string   "nature"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["stat_bonus_set_id"], name: "index_careers_on_stat_bonus_set_id", using: :btree
  end

  create_table "characters", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "name"
    t.string   "race"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "age"
    t.string   "gender"
    t.string   "sign"
    t.string   "eye_color"
    t.string   "hair_color"
    t.string   "birth_place"
    t.integer  "siblings"
    t.string   "notable_details"
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["player_id"], name: "index_characters_on_player_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_inventories_on_owner_id", using: :btree
  end

  create_table "inventory_changes", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "inventory_id"
    t.integer  "movement"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["inventory_id"], name: "index_inventory_changes_on_inventory_id", using: :btree
    t.index ["item_id"], name: "index_inventory_changes_on_item_id", using: :btree
  end

  create_table "parentages", force: :cascade do |t|
    t.integer  "source_career_id"
    t.integer  "leads_to_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["leads_to_id"], name: "index_parentages_on_leads_to_id", using: :btree
    t.index ["source_career_id"], name: "index_parentages_on_source_career_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_players_on_group_id", using: :btree
    t.index ["user_id"], name: "index_players_on_user_id", using: :btree
  end

  create_table "skillsets", force: :cascade do |t|
    t.integer  "career_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_skillsets_on_career_id", using: :btree
  end

  create_table "stat_bonus_sets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stat_bonuses", force: :cascade do |t|
    t.integer  "stat_bonus_set_id"
    t.integer  "amount"
    t.string   "reason"
    t.string   "context"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["stat_bonus_set_id"], name: "index_stat_bonuses_on_stat_bonus_set_id", using: :btree
  end

  create_table "stat_changes", force: :cascade do |t|
    t.integer  "base_stat_id"
    t.integer  "amount"
    t.integer  "reason_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["base_stat_id"], name: "index_stat_changes_on_base_stat_id", using: :btree
    t.index ["reason_id"], name: "index_stat_changes_on_reason_id", using: :btree
  end

  create_table "stats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talents", force: :cascade do |t|
    t.string   "name"
    t.integer  "stat_bonus_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["stat_bonus_id"], name: "index_talents_on_stat_bonus_id", using: :btree
  end

  create_table "things", force: :cascade do |t|
    t.integer  "quantity"
    t.string   "unit"
    t.string   "name"
    t.integer  "enc_per_unit"
    t.string   "localization"
    t.text     "details"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "language",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "weapons", force: :cascade do |t|
    t.string   "name"
    t.integer  "enc"
    t.string   "group"
    t.integer  "damage"
    t.integer  "reach"
    t.string   "reload"
    t.text     "attributes"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "availabilities", "skillsets"
  add_foreign_key "awarenesses", "users"
  add_foreign_key "base_stats", "stats"
  add_foreign_key "campaigns", "groups"
  add_foreign_key "career_changes", "characters"
  add_foreign_key "careers", "stat_bonus_sets"
  add_foreign_key "characters", "players"
  add_foreign_key "inventory_changes", "inventories"
  add_foreign_key "players", "groups"
  add_foreign_key "players", "users"
  add_foreign_key "skillsets", "careers"
  add_foreign_key "stat_bonuses", "stat_bonus_sets"
  add_foreign_key "stat_changes", "base_stats"
end
