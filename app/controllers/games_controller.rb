class GamesController < ApplicationController
	
	helper GamesHelper

	def show
		games = params[:id]
		case games
		when "fixed_deposit"
			render template: 'games/fixed_deposit'
		when "unit_trust"
			generate_unit_trust_variables
			render template: 'games/unit_trust'
		when "stock"
			render template: 'games/stock'
		end
	end

	def index
	end

end
