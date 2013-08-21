class Questionario < ActiveRecord::Base
	has_many :areas
	has_many :cursos
	has_many :modelos
end
