class Area < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :questionario
end
