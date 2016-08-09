class GamesController < ApplicationController
	before_action :set_user_and_profile

	require 'json'
	include GamesHelper

	def show
		games = params[:id]
		case games
		when "fixed_deposit"
			@initial_fixed_deposit_rates = JSON.parse(fixed_deposit_rates)
			render template: 'games/fixed_deposit'
		when "unit_trust"
			@initial_unit_trust_rate = unit_trust_rates
			render template: 'games/unit_trust'
		when "stock"
			@initial_stock_rates = stock_rates
			render template: 'games/stock'
		end
	end

	def index
		# lines below for temp use until profile controller has been setup
		# @user = User.find(2)
		@game1 = Game.create(name: "fixed deposit")
		@game2 = Game.create(name: "unit trust")
		@game3 = Game.create(name: "stock")
	end

	# rates refresher
	def refresh_fixed_depoits_rates
		@new_fixed_deposit_rate = fixed_deposit_rates
		respond_to do |format|
			format.json {render json: @new_fixed_deposit_rate}
		end
	end

	def refresh_unit_trust_rates
		@new_unit_trust_rate = unit_trust_rates
		respond_to do |format|
			format.json {render json: @new_unit_trust_rate}
		end
	end

	def refresh_stock_rates
		@new_stock_rate = stock_rates
		respond_to do |format|
			format.json {render json: @new_stock_rate}
		end
	end
	
	private

	def set_user_and_profile
		@user = current_user
		@profile = @user.profiles.find_by(active: true)
	end
end
