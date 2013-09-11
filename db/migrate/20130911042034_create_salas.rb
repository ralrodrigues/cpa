class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.references :turma, index: true
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
