class TransactionsController < ApplicationController
	def create
		@transaction = Transaction.new(transaction_params)
		@transaction.profile_id = Profile.find_by(user_id: current_user.id, active: true).id
		if @transaction.save
			@msg = "You have withdrawn your fixed deposit placement"
		end
	end
	def show
	end
	def index
		@user_transaction = Transaction.last
		@profile = Profile.find_by(user_id: current_user.id)
		@for_chart = Transaction.all
	end

	private
	def transaction_params
		params.require(:transaction).permit(:game_id, :start_amount, :end_amount, :months)
	end
end
