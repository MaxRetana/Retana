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

ActiveRecord::Schema[7.0].define(version: 2023_05_23_154516) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anticipos", force: :cascade do |t|
    t.bigint "arquitecto_id"
    t.bigint "obra_id"
    t.string "fecha"
    t.integer "cantidad"
    t.string "concepto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arquitecto_id"], name: "index_anticipos_on_arquitecto_id"
    t.index ["obra_id"], name: "index_anticipos_on_obra_id"
  end

  create_table "arquitectos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "obras", force: :cascade do |t|
    t.string "nombre"
    t.bigint "arquitecto_id"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arquitecto_id"], name: "index_obras_on_arquitecto_id"
  end
 
  add_foreign_key "anticipos", "arquitectos"
  add_foreign_key "anticipos", "obras"
  add_foreign_key "obras", "arquitectos"
  

end
