class ProfilesController < ApplicationController

	def create
	end

	def update
		@profile = Profile.find_by(user_id: current_user.id, active: true)
		@profile.current_balance += user_transaction_param[:current_balance].to_f
		@profile.save
		
	end

	def show
	end

	def index
	end


	private
	def user_transaction_param
		params.permit(:current_balance, :_method, :id)
	end
end
