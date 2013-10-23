class Usuario < ActiveRecord::Base
	has_many :funcionario, dependent: :destroy
	
	has_many :respostas
	has_many :perguntas, through: :respostas
	has_many :comentarios
	
	has_many :salas
	has_many :turmas, through: :salas

end