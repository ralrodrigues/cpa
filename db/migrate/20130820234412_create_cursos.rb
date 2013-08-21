class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome
      t.string :sigla
      t.string :nivel
      t.string :periodo
      t.integer :semestre_atual
      t.integer :semestres_duracao
      t.integer :qtd_alunos
      t.string :observacao
      t.references :questionario, index: true
      t.references :area, index: true

      t.timestamps
    end
  end
end
