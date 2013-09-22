class PreparacaoController < ApplicationController

	def areas
		@questionario = Questionario.find(params[:questionario_id])
		@areas = @questionario.areas
	end

end
