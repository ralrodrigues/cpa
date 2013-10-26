class Usuario < ActiveRecord::Base
	has_many :funcionarios, dependent: :destroy
	
	has_many :respostas
	has_many :perguntas, through: :respostas
	has_many :comentarios
	
	has_many :salas
	has_many :turmas, through: :salas

	amoeba do
		include_field :funcionarios
		exclude_field :salas
		exclude_field :respostas
        exclude_field :comentarios
		enable
	end

end