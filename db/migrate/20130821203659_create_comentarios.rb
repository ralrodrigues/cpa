class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :comentario
      t.references :usuario, index: true
      t.references :turma, index: true

      t.timestamps
    end
  end
end
