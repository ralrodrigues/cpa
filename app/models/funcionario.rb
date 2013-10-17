class Funcionario < ActiveRecord::Base
  has_one :area
  belongs_to :area
  belongs_to :usuario
  has_one :turma 

  accepts_nested_attributes_for :usuario
  
  validates :apelido, :presence =>{message: "precisa ser escrito"}, allow_nil: true   
  
  validates :nome, :prontuario, :email, length: {
    minimum: 5,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

end
