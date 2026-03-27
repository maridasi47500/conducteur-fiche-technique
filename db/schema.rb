# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2026_03_27_201816) do
  create_table "conducteurlines", force: :cascade do |t|
    t.string "conducteur_id"
    t.time "duree"
    t.string "sequenceaction"
    t.string "interpretes"
    t.string "lumieres_ambiante"
    t.string "lumieres_effet"
    t.string "machine_brouillard"
    t.string "videoprojection"
    t.string "notes_technicien"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conducteurs", force: :cascade do |t|
    t.string "title"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fiche_techniques", force: :cascade do |t|
    t.string "name_event"
    t.string "eleve_responsable"
    t.string "date"
    t.string "professeur_referent"
    t.string "notes_complementaires"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materiel_necessaires", force: :cascade do |t|
    t.string "fiche_technique_id"
    t.string "materiel_id"
    t.string "quantite"
    t.string "precisions_observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materiels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_de_scene_dessins", force: :cascade do |t|
    t.string "fiche_technique_id"
    t.string "disposition"
    t.string "materiel_musicien"
    t.string "ordre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projet_artistiques", force: :cascade do |t|
    t.integer "fiche_technique_id"
    t.integer "conducteur_id"
    t.string "title"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
