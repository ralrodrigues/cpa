class Disciplina < ActiveRecord::Base
  belongs_to :curso
  has_many :turmas, dependent: :destroy
 
  amoeba do
    enable
  end  

  validates :curso_id, :presence =>{message: "precisa ser selecionado"}, allow_nil: true   

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
  	greater_than_or_equal_to: 1,
    less_than_or_equal_to: 15, 
    message: "deve ser entre de 1 e 15 semestres"
  } 
  
  def create_turmas
    begin
      if self.turmas.count != 0
        turmas = Turma.where(disciplina: self)
        turmas.each{|turma| turma.destroy}
      end
      sigla = "A"
      self.qtd_professores.times do
        if self.qtd_professores == 1
          Turma.create(sigla: "A/B", disciplina: self)
        else
          Turma.create(sigla: sigla, disciplina: self)
          sigla = sigla.next
        end
      end 
    rescue => ex
      logger.error ex.message
    end 
  end

end

