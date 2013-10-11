class Modelo < ActiveRecord::Base
  belongs_to :questionario
  has_many :topicos, dependent: :destroy

  amoeba do
    enable
  end
  
private 

  def Modelo.docente(modelos)
	modelos.where("nome LIKE 'Global Docente' OR nome LIKE 'Turma Docente'")
  end
	
  def Modelo.discente(modelos)
  	modelos.where("nome LIKE 'Global Discente' OR nome LIKE 'Turma Dicente'")
  end

  def Modelo.tae(modelos)
  	modelos.where(nome: 'Global TAE')
  end

end
