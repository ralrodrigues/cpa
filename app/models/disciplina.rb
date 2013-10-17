class Disciplina < ActiveRecord::Base
  belongs_to :curso
  has_many :turmas, dependent: :destroy
 
  amoeba do
    enable
  end
  
  validates :nome, length: {
    minimum: 5,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

  validates :sigla, length: {
    minimum: 3,
    maximum: 10,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

  validates :qtd_professores, numericality: { 
  	only_integer: true,
  	greater_than: 0, message: "deve ter mais de %{count} professor",
    less_than: 15, message: "deve ter menos %{count} professores"
  } 


end

