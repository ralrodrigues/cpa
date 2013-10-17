class Turma < ActiveRecord::Base
  belongs_to :funcionario
  belongs_to :disciplina


  has_many :salas, dependent: :destroy
  

	has_many :salas
	has_many :usuarios, through: :salas

	

end
