class RemoveUsuarioReferenceFromAreas < ActiveRecord::Migration
  def change
    remove_reference :areas, :usuario, index: true
    add_reference :areas, :funcionario, index: true
  end
end
