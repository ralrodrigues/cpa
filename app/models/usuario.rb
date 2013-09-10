class Usuario < ActiveRecord::Base
	has_one :funcionario, dependent: :destroy
	has_many :respostas
	has_many :comentarios
	
  has_many :turmas_alunos
end
