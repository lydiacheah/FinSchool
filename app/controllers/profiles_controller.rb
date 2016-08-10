class ProfilesController < ApplicationController

	def create
	end

	def update
		@profile = Profile.find_by(user_id: current_user.id, active: true)
		@profile.current_balance += user_transaction_param[:current_balance].to_f
		@profile.save
		
	end

	def show
		@user_transaction = Transaction.last
		
		@for_chart = Transaction.all

		## For the current user, determine the profile ID
		@profile = Profile.find_by(user_id: current_user.id)
		## From the profile ID, list out all the transactions
		@user_list_transaction = @profile.transactions


		##                First Row                ##
		## Calculation of variables to be charted:

		@financial_goal = 500000
		# @current_balance = 12000

		## Fixed Deposit ROI values
		@fixed_deposit_roi = 0.56

		## Unit Trust ROI values
		@unit_trust_roi = 0.23

		## Stock Market ROI values
		@stock_market_roi = 0.45
		@current_balance = @profile.current_balance/@profile.financial_goal * 100

		##                Second Row                ##
		## Calculation of variables to be charted:

		## 1. Vertical Bars, sum of amount earned by day ##
		fd_earning_d3 = 1000 ## today
		fd_earning_d2 = 500 ## yesterday
		fd_earning_d1 = 250 ## 2 days before

		ut_earning_d3 = 1000 ## today
		ut_earning_d2 = 500 ## yesterday
		ut_earning_d1 = 250 ## 2 days before

		sm_earning_d3 = 1000 ## today
		sm_earning_d2 = 500 ## yesterday
		sm_earning_d1 = 250 ## 2 days before

		@daily_earnings = [
			{name: "Fixed Deposit", data: [["Today - 2", fd_earning_d1],
											["Today - 1", fd_earning_d2],
											["Today", fd_earning_d3]]},
			{name: "Unit Trust", data: [["Today - 2", ut_earning_d1],
										["Today - 1", ut_earning_d2],
										["Today", ut_earning_d3]]},
			{name: "Stock Market", data: [["Today - 2", sm_earning_d1],
										["Today - 1", sm_earning_d2],
										["Today", sm_earning_d3]]}
		]

		## Horizontal Bars, sum of amount earned by game ##
		fd_total_earnings = 12000
		ut_total_earnings = 15000
		sm_total_earnings = 18000
		@activity_earnings = [["Fixed Deposit",fd_total_earnings],
							["Unit Trust",ut_total_earnings],
							["Stock Market",sm_total_earnings]]


		##                Third Row                ##
		## Calculation of variables to be charted:
	end

	def index
	end


	private

	def user_transaction_param
		params.permit(:current_balance, :_method, :id)
	end
end
