class Area < ActiveRecord::Base
  belongs_to :questionario
  has_many :usuarios
  belongs_to :usuario
end
