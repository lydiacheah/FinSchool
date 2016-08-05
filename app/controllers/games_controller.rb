class GamesController < ApplicationController
	def show
		games = params[:id]
		case games
		when "fixed_deposit"
			render template: 'games/fixed_deposit'
		when "unit_trust"
			render template: 'games/unit_trust'
		when "stock"
			render template: 'games/stock'
		end
	end

	def index
	end
end
