class Curso < ActiveRecord::Base
  belongs_to :questionario
  belongs_to :area
  
  has_many :disciplinas

  amoeba do
    enable
  end
end
