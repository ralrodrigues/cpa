class Resposta < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :pergunta
  belongs_to :turma
end
