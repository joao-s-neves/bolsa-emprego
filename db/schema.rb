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

ActiveRecord::Schema.define(version: 20170119122340) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.datetime "date"
    t.string   "summary"
    t.string   "text"
    t.string   "picture"
    t.boolean  "active"
    t.boolean  "featured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.datetime "birth_date"
    t.string   "document"
    t.string   "habilitation_description"
    t.string   "experience"
    t.integer  "professional_area_id"
    t.integer  "habilitations_id"
    t.integer  "professional_situation_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "curriculum"
    t.index ["habilitations_id"], name: "index_candidates_on_habilitations_id"
    t.index ["professional_area_id"], name: "index_candidates_on_professional_area_id"
    t.index ["professional_situation_id"], name: "index_candidates_on_professional_situation_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "nif"
    t.integer  "professional_activity_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["professional_activity_id"], name: "index_companies_on_professional_activity_id"
  end

  create_table "habilitations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "begins"
    t.datetime "ends"
    t.string   "contract_type"
    t.string   "salary"
    t.boolean  "active"
    t.integer  "company_id"
    t.integer  "professional_activity_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "picture"
    t.index ["company_id"], name: "index_offers_on_company_id"
    t.index ["professional_activity_id"], name: "index_offers_on_professional_activity_id"
  end

  create_table "professional_activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professional_areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professional_situations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "contact"
    t.string   "page"
    t.string   "presentation"
    t.integer  "user_type"
    t.integer  "candidate_id"
    t.integer  "company_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "picture"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["candidate_id"], name: "index_users_on_candidate_id"
    t.index ["company_id"], name: "index_users_on_company_id"
  end

end
