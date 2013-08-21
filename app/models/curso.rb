class Curso < ActiveRecord::Base
  belongs_to :questionario
  belongs_to :area
end
