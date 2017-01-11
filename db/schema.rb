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

ActiveRecord::Schema.define(version: 20170111140136) do

  create_table "candidates", force: :cascade do |t|
    t.datetime "d_nascimento"
    t.string   "cartao_cidadao"
    t.string   "area_profissional"
    t.string   "hab_literarias"
    t.string   "hab_ds"
    t.string   "situacao"
    t.string   "experiencia"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "nif"
    t.string   "atividade_profissional"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "morada"
    t.string   "cpostal"
    t.string   "localidade"
    t.string   "contacto"
    t.string   "pagina"
    t.string   "apresentacao"
    t.string   "tipo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

end
