class ProfilesController < ApplicationController

	def create
		byebug
		@profile = Profile.new(profile_params)
		if @profile.save
			redirect_to games_path
		else
			redirect_to edit_user_path(current_user)
		end
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

	def profile_params
		params.require(:profile).permit(:financial_goal)
	end

	def user_transaction_param
		params.permit(:current_balance, :_method, :id)
	end
end
