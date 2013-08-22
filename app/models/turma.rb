class Turma < ActiveRecord::Base
  belongs_to :funcionario
  belongs_to :disciplina
  has_one :turmas_alunos
end
