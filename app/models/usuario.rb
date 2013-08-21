class Usuario < ActiveRecord::Base
	has_one :professor
	has_one :tae
	has_one :area
	belongs_to :area
end
