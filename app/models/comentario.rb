class Comentario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :turma
end
