class Turma < ActiveRecord::Base
  belongs_to :funcionario
  belongs_to :disciplina

  has_many :turmas_alunos
end
