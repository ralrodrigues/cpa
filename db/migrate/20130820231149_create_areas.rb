class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :nome
      t.references :usuario, index: true
      t.references :questionario, index: true

      t.timestamps
    end
  end
end
