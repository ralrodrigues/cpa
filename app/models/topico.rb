class Topico < ActiveRecord::Base
  belongs_to :modelo
  has_many :perguntas, dependent: :destroy

  amoeba do
    enable
  end
  
  validates :modelo_id, :presence =>{message: "precisa ser selecionado"}, allow_nil: true   

  validates :nome, length: {
    minimum: 3,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

end
