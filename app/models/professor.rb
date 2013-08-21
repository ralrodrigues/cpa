class Professor < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :area
end
