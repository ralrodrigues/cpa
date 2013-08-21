class CreatePerguntas < ActiveRecord::Migration
  def change
    create_table :perguntas do |t|
      t.string :enunciado
      t.string :tipo
      t.references :topico, index: true

      t.timestamps
    end
  end
end
