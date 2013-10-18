class Pergunta < ActiveRecord::Base
  belongs_to :topico
  has_many :respostas

  amoeba do
    enable
  end

  validates :topico_id, :presence =>{message: "precisa ser selecionado"}, allow_nil: true   
  
  # validates_each :tipo do |record, attr, value|
  #   record.errors.add(attr, 'selecionado não é válido') unless value == "interger" or value == "boolean"
  # end

  validates :enunciado, :tipo, length: {
    minimum: 5,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }
end
  

