class CreateTurmasAlunos < ActiveRecord::Migration
  def change
    create_table :turmas_alunos do |t|
      t.references :turma, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
