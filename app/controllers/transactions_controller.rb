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

		# For the current user, determine the profile ID
		@profile = Profile.find_by(user_id: current_user.id)
	
		# From the profile ID, list out all the transactions
		@user_list_transaction = @profile.transactions

		# Calculating progress towards financial goals
		@financial_goal = @profile.financial_goal
		@current_balance = @profile.current_balance
		@financial_progress = (@current_balance/@financial_goal)*100

		## Fixed Deposit ROI values
		@fd_investments = @user_list_transaction.where(game_id: 1).sum(:start_amount)
		@fd_returns = @user_list_transaction.where(game_id: 1).sum(:end_amount)
		@fixed_deposit_roi = ((@fd_returns-@fd_investments)/@fd_investments) * 100

		## Unit Trust ROI values
		@ut_investments = @user_list_transaction.where(game_id: 2).sum(:start_amount)
		@ut_returns = @user_list_transaction.where(game_id: 2).sum(:end_amount)
		@unit_trust_roi = ((@ut_returns-@ut_investments)/@ut_investments) * 100

		## Stock Market ROI values
		@sm_investments = @user_list_transaction.where(game_id: 3).sum(:start_amount)
		@sm_returns = @user_list_transaction.where(game_id: 3).sum(:end_amount)
		@stock_market_roi = ((@sm_returns-@sm_investments)/@sm_investments) * 100

		## Vertical Bars, sum of amount earned by day ##
		fd_daily_earnings = @user_list_transaction.where(game_id: 1)
							.group_by_day(:created_at, last: 3, format: "%B %d, %Y")
							.sum(:end_amount)

		ut_daily_earnings = @user_list_transaction.where(game_id: 2)
							.group_by_day(:created_at, last: 3, format: "%B %d, %Y")
							.sum(:end_amount)

		sm_daily_earnings = @user_list_transaction.where(game_id: 3)
							.group_by_day(:created_at, last: 3, format: "%B %d, %Y")
							.sum(:end_amount)

		# send the calculated data to the Vertical Bars
		@daily_earnings = [
			{name: "Fixed Deposit", data: fd_daily_earnings},
			{name: "Unit Trust", data: ut_daily_earnings},
			{name: "Stock Market", data: sm_daily_earnings}
			]

		## Horizontal Bars, sum of amount earned by game ##
		fd_total_earnings = @user_list_transaction.where(game_id: 1).sum(:end_amount)
		ut_total_earnings = @user_list_transaction.where(game_id: 2).sum(:end_amount)
		sm_total_earnings = @user_list_transaction.where(game_id: 3).sum(:end_amount)
		@activity_earnings = [["Fixed Deposit",fd_total_earnings],
							["Unit Trust",ut_total_earnings],
							["Stock Market",sm_total_earnings]]


	end

	private
	def transaction_params
		params.require(:transaction).permit(:game_id, :start_amount, :end_amount, :months)
	end
end
