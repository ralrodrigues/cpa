class CreateDisciplinas < ActiveRecord::Migration
  def change
    create_table :disciplinas do |t|
      t.string :nome
      t.string :sigla
      t.integer :qtd_professores
      t.references :curso, index: true

      t.timestamps
    end
  end
end
