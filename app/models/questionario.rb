class Questionario < ActiveRecord::Base
	has_many :areas, dependent: :destroy
	has_many :cursos, dependent: :destroy
	has_many :modelos, dependent: :destroy

  amoeba do
    enable
  end

	def Questionario.em_preparacao(questionarios)
		questionarios.select { |questionario| questionario.inicio_votacao.nil? }
	end
	
	def Questionario.em_votacao(questionarios)
  	questionarios.select { |questionario| questionario.inicio_votacao && questionario.termino_votacao.nil? }
  end

  def Questionario.encerrados(questionarios)
  	questionarios.select { |questionario| questionario.inicio_votacao && questionario.termino_votacao }
  end

	def em_preparacao?
		inicio_votacao.nil? && termino_votacao.nil? ? true : false
	end

	def em_votacao?
		inicio_votacao && termino_votacao.nil? ? true : false
	end

	def encerrado?
		inicio_votacao && termino_votacao 			? true : false
	end
end
