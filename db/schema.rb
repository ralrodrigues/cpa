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

ActiveRecord::Schema.define(version: 20130821011158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: true do |t|
    t.string   "nome"
    t.integer  "usuario_id"
    t.integer  "questionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "areas", ["questionario_id"], name: "index_areas_on_questionario_id", using: :btree
  add_index "areas", ["usuario_id"], name: "index_areas_on_usuario_id", using: :btree

  create_table "cursos", force: true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.string   "nivel"
    t.string   "periodo"
    t.integer  "semestre_atual"
    t.integer  "semestres_duracao"
    t.integer  "qtd_alunos"
    t.string   "observacao"
    t.integer  "questionario_id"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cursos", ["area_id"], name: "index_cursos_on_area_id", using: :btree
  add_index "cursos", ["questionario_id"], name: "index_cursos_on_questionario_id", using: :btree

  create_table "disciplinas", force: true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.integer  "qtd_professores"
    t.integer  "curso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "disciplinas", ["curso_id"], name: "index_disciplinas_on_curso_id", using: :btree

  create_table "questionarios", force: true do |t|
    t.string   "nome"
    t.date     "inicio_votacao"
    t.date     "previsao_termino"
    t.date     "termino_votacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turmas", force: true do |t|
    t.string   "sigla"
    t.integer  "disciplina_id"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "turmas", ["disciplina_id"], name: "index_turmas_on_disciplina_id", using: :btree
  add_index "turmas", ["professor_id"], name: "index_turmas_on_professor_id", using: :btree

end
