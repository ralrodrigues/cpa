class Sala < ActiveRecord::Base
  belongs_to :turma
  belongs_to :usuario

end