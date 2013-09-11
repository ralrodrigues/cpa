class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :senha
      t.string :tipo
      t.string :faixa_etaria

      t.timestamps
    end
  end
end
