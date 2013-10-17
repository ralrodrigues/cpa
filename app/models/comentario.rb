class Comentario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :turma

  validates :comentario, length: {
    minimum: 25,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

end
