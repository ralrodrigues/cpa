class Curso < ActiveRecord::Base
  belongs_to :questionario
  belongs_to :area
  
  has_many :disciplinas, dependent: :destroy

  amoeba do
    enable
  end

  validates :area_id, :presence =>{message: "precisa ser selecionada"}, allow_nil: true

  validates :nome, length: {
    minimum: 10,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

  validates :sigla, length: {
    minimum: 3,
    maximum: 9,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

  validates :nivel, :periodo, length: {
    minimum: 5,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

  validates :observacao, length: {
    minimum: 0,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }, allow_nil: true

  validates :qtd_alunos, numericality: { 
  	only_integer: true,
  	greater_than_or_equal_to: 1,
    less_than_or_equal_to: 100,
    message: "deve ser entre 1 e 100 alunos"
  } 

  validates :semestres_duracao, numericality: { 
  	only_integer: true,
  	greater_than_or_equal_to: 1,
    less_than_or_equal_to: 12,
    message: "deve ser entre de 1 e 12 semestres"
  }

  validates :semestre_atual, numericality: { 
  	only_integer: true,
  	greater_than_or_equal_to: 1,
    less_than_or_equal_to: :semestres_duracao, 
    message: "deve ser entre 1 e o valor do Semestres de Duração"

  } 

end
