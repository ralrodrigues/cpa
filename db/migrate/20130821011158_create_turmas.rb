class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.string :sigla
      t.references :disciplina, index: true
      t.references :professor, index: true

      t.timestamps
    end
  end
end
