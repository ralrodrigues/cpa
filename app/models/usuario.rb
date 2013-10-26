class Usuario < ActiveRecord::Base
	has_many :funcionario, dependent: :destroy
	
	has_many :respostas
	has_many :perguntas, through: :respostas
	has_many :comentarios
	
	has_many :salas
	has_many :turmas, through: :salas

  def Usuario.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Usuario.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

	def create_remember_token
    self.remember_token = Usuario.encrypt(Usuario.new_remember_token)
  end
end