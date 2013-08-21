class CreateTaes < ActiveRecord::Migration
  def change
    create_table :taes do |t|
      t.string :nome
      t.string :prontuario
      t.string :email
      t.references :usuario, index: true

      t.timestamps
    end
  end
end
