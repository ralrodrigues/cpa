class Turma < ActiveRecord::Base
  belongs_to :funcionario
  belongs_to :disciplina

<<<<<<< HEAD
  has_many :turmas_alunos, dependent: :destroy
  
=======
	has_many :salas
	has_many :usuarios, through: :salas
>>>>>>> upstream/master
end
