class CreateTopicos < ActiveRecord::Migration
  def change
    create_table :topicos do |t|
      t.string :nome
      t.references :modelo, index: true

      t.timestamps
    end
  end
end
