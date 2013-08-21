class Questionario < ActiveRecord::Base
	has_many :areas
	has_many :cursos
end
