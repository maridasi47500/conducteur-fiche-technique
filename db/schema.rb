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

ActiveRecord::Schema[7.1].define(version: 2026_04_07_024452) do
  create_table "ambiance_options", force: :cascade do |t|
    t.integer "style_id", null: false
    t.string "category"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["style_id"], name: "index_ambiance_options_on_style_id"
  end

  create_table "conducteurhasmarkers", force: :cascade do |t|
    t.integer "conducteur_id"
    t.integer "emotional_marker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string "son"
    t.string "ordre"
  end

  create_table "conducteurs", force: :cascade do |t|
    t.string "title"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fiche_technique_id"
    t.string "tempo_range"
  end

  create_table "emotional_markers", force: :cascade do |t|
    t.string "name"
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

  create_table "inspiration_resources", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "category"
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
    t.boolean "on_stage"
    t.integer "maximum"
    t.string "zone_y"
    t.boolean "power_needed"
    t.string "category"
    t.string "default_layer"
    t.boolean "requires_power", default: false
    t.boolean "is_bundle", default: false
    t.integer "spread"
    t.integer "x_pref"
    t.integer "zone_id"
    t.index ["zone_id"], name: "index_materiels_on_zone_id"
  end

  create_table "metier_dependencies", force: :cascade do |t|
    t.integer "materiel_id"
    t.integer "required_item_id"
    t.integer "qty_multiplier"
    t.string "note"
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
    t.integer "coord_x"
    t.integer "coord_y"
    t.string "layer"
  end

  create_table "projet_artistiques", force: :cascade do |t|
    t.integer "fiche_technique_id"
    t.integer "conducteur_id"
    t.string "title"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "style"
  end

  create_table "sequence_templates", force: :cascade do |t|
    t.string "label"
    t.string "phase"
    t.string "target_talent"
    t.string "suggested_light"
    t.string "intensity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "style_id", null: false
    t.index ["style_id"], name: "index_sequence_templates_on_style_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.integer "y_min"
    t.integer "y_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ambiance_options", "styles"
  add_foreign_key "materiels", "zones"
  add_foreign_key "sequence_templates", "styles"
end
