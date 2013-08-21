class CreateProfessores < ActiveRecord::Migration
  def change
    create_table :professores do |t|
      t.string :nome
      t.string :prontuario
      t.string :email
      t.references :usuario, index: true
      t.references :area, index: true

      t.timestamps
    end
  end
end
