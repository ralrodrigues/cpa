class Pergunta < ActiveRecord::Base
  belongs_to :topico
  has_many :respostas

  amoeba do
    enable
  end

  validates :topico_id, :presence =>{message: "precisa ser selecionado"}, allow_nil: true   
  
  validates :tipo, presence: true, if: :interger?, if: :boolean?

  validates :enunciado, :tipo, length: {
    minimum: 5,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

  def interger?
    tipo == "interger"
  end
  
  def boolean?
    tipo == "boolean"
  end
    
end
