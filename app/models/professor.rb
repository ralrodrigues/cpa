class Professor < ActiveRecord::Base
	belongs_to :usuario, dependent: :destroy
end
