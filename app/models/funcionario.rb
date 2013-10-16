class Funcionario < ActiveRecord::Base
  has_one :area
  belongs_to :area
  belongs_to :usuario
  has_one :turma 

  accepts_nested_attributes_for :usuario
end
