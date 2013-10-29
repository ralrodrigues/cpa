class Funcionario < ActiveRecord::Base
  has_one :area
  belongs_to :area
  belongs_to :usuario
  has_one :turma 

  accepts_nested_attributes_for :usuario
  
  amoeba do
    exclude_field :turma
    include_field :usuario
    enable
  end

  validates :apelido, format:{ with: /\A[A-Z]+\z/,
    message: "Somente letras maiusculas"}, allow_nil: true   
  
  validates :nome, :prontuario, :email, length: {
    minimum: 5,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

end
