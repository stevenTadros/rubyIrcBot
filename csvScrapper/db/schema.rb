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

ActiveRecord::Schema.define(version: 20170509172249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.text     "EAN"
    t.text     "MARQUE"
    t.text     "REF_FABRICANT"
    t.text     "CATEGORIES"
    t.text     "NOM_PRODUIT"
    t.text     "DESCRIPTION"
    t.text     "POIDS"
    t.text     "LARGEUR"
    t.text     "PROFONDEUR"
    t.text     "HAUTEUR"
    t.text     "STOCK"
    t.text     "PRIX_ACHAT_HT"
    t.text     "PORT_FR_HT"
    t.text     "PORT_DE_HT"
    t.text     "PORT_ES_HT"
    t.text     "PORT_IT_HT"
    t.text     "DELAI_EXPEDITION"
    t.text     "IMAGE1"
    t.text     "IMAGE2"
    t.text     "IMAGE3"
    t.text     "IMAGE4"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
