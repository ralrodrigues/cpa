class Usuario < ActiveRecord::Base
	has_one :funcionario
	has_many :respostas
	has_many :comentarios
	
  has_many :turmas_alunos
end
