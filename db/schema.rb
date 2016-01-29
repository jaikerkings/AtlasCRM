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

ActiveRecord::Schema.define(version: 20150903214254) do

  create_table "opcion_menus", force: :cascade do |t|
    t.integer  "idOpcion",      limit: 4
    t.string   "descripcion",   limit: 255
    t.string   "rutaDeAcceso",  limit: 255
    t.integer  "idOpcionPadre", limit: 4
    t.string   "estatus",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "opciones_por_rols", force: :cascade do |t|
    t.integer  "idOpcion",       limit: 4
    t.integer  "idRol",          limit: 4
    t.string   "detalles",       limit: 255
    t.boolean  "puedeGrabar",    limit: 1
    t.boolean  "puedeConsultar", limit: 1
    t.boolean  "puedeEliminar",  limit: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "rols", force: :cascade do |t|
    t.string   "idRol",       limit: 255
    t.string   "descripcion", limit: 255
    t.string   "estatus",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.integer  "idUsuario",        limit: 4
    t.string   "email",            limit: 255
    t.string   "username",         limit: 255
    t.string   "contrasenha",      limit: 255
    t.integer  "idRol",            limit: 4
    t.string   "preguntaSecreta",  limit: 255
    t.string   "respuestaSecreta", limit: 255
    t.string   "recordarSesion",   limit: 255
    t.string   "formatoFoto",      limit: 255
    t.string   "foto",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
