class CreateModelos < ActiveRecord::Migration
  def change
    create_table :modelos do |t|
      t.string :nome
      t.string :visibilidade
      t.references :questionario, index: true

      t.timestamps
    end
  end
end
