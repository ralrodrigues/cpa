class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :apelido
      t.string :prontuario
      t.string :email
      t.references :usuario, index: true
      t.references :area, index: true
      t.references :turmas, index:true

      t.timestamps
    end
  end
end
