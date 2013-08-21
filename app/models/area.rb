class Area < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :questionario
  has_many :professores
end
