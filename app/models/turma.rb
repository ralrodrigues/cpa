class Turma < ActiveRecord::Base
  belongs_to :funcionario
  belongs_to :disciplina

  has_many :salas, dependent: :destroy
  
  has_many :salas
  has_many :usuarios, through: :salas

  has_many :respostas
  has_many :perguntas, through: :respostas
 
  amoeba do
    enable
    nullify :professor_id
  end

  validates :disciplina_id, :professor_id, :presence =>{message: "precisa ser selecionado"}, allow_nil: true   

  validates :sigla, length: { 
    minimum: 1,
    maximum: 3,
    too_short: "deve ter pelo menos %{count} caracter",
    too_long: "deve ter no máximo %{count} caracteres"
  }

end
