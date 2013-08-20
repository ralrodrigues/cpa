class CreateQuestionarios < ActiveRecord::Migration
  def change
    create_table :questionarios do |t|
      t.string :nome
      t.date :inicio_votacao
      t.date :previsao_termino
      t.date :termino_votacao

      t.timestamps
    end
  end
end
