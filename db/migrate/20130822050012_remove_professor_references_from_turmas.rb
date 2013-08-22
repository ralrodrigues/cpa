class RemoveProfessorReferencesFromTurmas < ActiveRecord::Migration
  def change
  	remove_reference :turmas, :professor, index: true
  	add_reference :turmas, :funcionario, index:true
  end
end
