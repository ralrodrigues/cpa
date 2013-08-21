class CreateRespostas < ActiveRecord::Migration
  def change
    create_table :respostas do |t|
      t.references :usuario, index: true
      t.references :pergunta, index: true
      t.references :turma, index: true
      t.string :resposta

      t.timestamps
    end
  end
end
