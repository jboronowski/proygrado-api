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

ActiveRecord::Schema.define(version: 2020_10_05_140039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "arbo_serotipos", force: :cascade do |t|
    t.bigint "arbo_id"
    t.bigint "serotipo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arbo_id"], name: "index_arbo_serotipos_on_arbo_id"
    t.index ["serotipo_id"], name: "index_arbo_serotipos_on_serotipo_id"
  end

  create_table "arbos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "barrios", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuidads", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distrito_cuidad_barrios", force: :cascade do |t|
    t.bigint "barrio_id"
    t.bigint "cuidad_id"
    t.bigint "distrito_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barrio_id"], name: "index_distrito_cuidad_barrios_on_barrio_id"
    t.index ["cuidad_id"], name: "index_distrito_cuidad_barrios_on_cuidad_id"
    t.index ["distrito_id"], name: "index_distrito_cuidad_barrios_on_distrito_id"
  end

  create_table "distritos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laboratorios", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notificacions", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.integer "edad"
    t.string "sexo"
    t.date "fecha_notificacion"
    t.date "fecha_sintoma"
    t.bigint "barrio_id"
    t.bigint "cuidad_id"
    t.bigint "distrito_id"
    t.geometry "lonlat", limit: {:srid=>0, :type=>"st_point"}
    t.boolean "estado"
    t.bigint "arbo_id"
    t.bigint "serotipo_id"
    t.bigint "usuario_laboratorio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arbo_id"], name: "index_notificacions_on_arbo_id"
    t.index ["barrio_id"], name: "index_notificacions_on_barrio_id"
    t.index ["cuidad_id"], name: "index_notificacions_on_cuidad_id"
    t.index ["distrito_id"], name: "index_notificacions_on_distrito_id"
    t.index ["serotipo_id"], name: "index_notificacions_on_serotipo_id"
    t.index ["usuario_laboratorio_id"], name: "index_notificacions_on_usuario_laboratorio_id"
  end

  create_table "serotipos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuario_laboratorios", force: :cascade do |t|
    t.string "nombre"
    t.string "ci"
    t.bigint "laboratorio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratorio_id"], name: "index_usuario_laboratorios_on_laboratorio_id"
  end

  add_foreign_key "arbo_serotipos", "arbos"
  add_foreign_key "arbo_serotipos", "serotipos"
  add_foreign_key "distrito_cuidad_barrios", "barrios"
  add_foreign_key "distrito_cuidad_barrios", "cuidads"
  add_foreign_key "distrito_cuidad_barrios", "distritos"
  add_foreign_key "notificacions", "arbos"
  add_foreign_key "notificacions", "barrios"
  add_foreign_key "notificacions", "cuidads"
  add_foreign_key "notificacions", "distritos"
  add_foreign_key "notificacions", "serotipos"
  add_foreign_key "notificacions", "usuario_laboratorios"
  add_foreign_key "usuario_laboratorios", "laboratorios"
end
