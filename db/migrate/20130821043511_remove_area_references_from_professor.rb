class RemoveAreaReferencesFromProfessor < ActiveRecord::Migration
  def change
    remove_reference :professores, :area, index: true
  end
end
