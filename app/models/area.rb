class Area < ActiveRecord::Base
  belongs_to :questionario
  belongs_to :funcionario
  has_many :funcionarios, dependent: :destroy
  
  amoeba do
    enable
  end

  # validates :questionario_id, :presence =>{message: "precisa ser selecionado"}

  validates :nome, length: {
    minimum: 5,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }
  
  
end
