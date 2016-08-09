module GamesHelper

	def fixed_deposit_rates
		rate1 = rand(2.1..3.5).round(2)
		rate2 = rand(2.1..3.5).round(2)
		rate3 = rand(2.1..3.5).round(2)
		fd_rates = [rate1, rate2, rate3].to_json
	end

	def unit_trust_rates
		rate1 = rand(2.1..3.5).round(2)
		rate2 = rand(2.1..3.5).round(2)
		rate3 = rand(2.1..3.5).round(2)
		u_rates = [rate1, rate2, rate3].to_json
	end

	def stock_rates
		rate1 = rand(2.1..3.5).round(2)
		rate2 = rand(2.1..3.5).round(2)
		rate3 = rand(2.1..3.5).round(2)
		rate4 = rand(2.1..3.5).round(2)
		rate5 = rand(2.1..3.5).round(2)
    rate6 = rand(2.1..3.5).round(2)
    rate7 = rand(2.1..3.5).round(2)
    rate8 = rand(2.1..3.5).round(2)
    rate9 = rand(2.1..3.5).round(2)
		s_rates = [rate1, rate2, rate3, rate4, rate5, rate6, rate7, rate8, rate9].to_json
	end

  def current_user_active_profile
    @user_profile = Profile.find_by(user_id: current_user.id, active: true)
  end

 #  def generate_unit_trust_variables
	# @test = "Hello World"
 #  end

  # def calculator_unit_trust
  #   include Math	
   	
  #  	## Determine investment options and its corresponding rates
  #   fund_a_rates = rand(0.2..0.5)
  #   fund_b_rates = rand(0.4..0.8)
  #   fund_c_rates = rand(0.6..1)

  #   puts "Please select which fund to buy"
  #   puts "(1) - Fund A -- NAV = #{fund_a_rates} / unit"
  #   puts "(2) - Fund B -- NAV = #{fund_b_rates} / unit"
  #   puts "(3) - Fund C -- NAV = #{fund_c_rates} / unit"

  #   ## Select investment option

  #   fund_selection = gets.chomp

  #   if fund_selection == "1"
  #  		nav_at_purchase = fund_a_rates
  #  		selection_valid = true
  #  	elsif fund_selection == "2"
		# nav_at_purchase = fund_b_rates
		# selection_valid = true   	
  #  	elsif fund_selection == "3"
  #  	    nav_at_purchase = fund_c_rates
  #  	    selection_valid = true
  #  	else
  #  		puts "No valid selection. Please try again."
  #  		selection_valid = false
  #  	end

  #   ## Determine amount of investment

  #   asset_available = 1000
  #   puts "How much to invest? RM #{asset_available} available"
  #   funds = gets.chomp
  #   puts "Funds available: RM #{funds}"

  #   if selection_valid
  #   ## Investment Overview
  #   	service_fee = 0.05
  #   	investment = funds.to_i * (1-service_fee)

  #   	puts "Funds for investment after deducting service fee: #{investment}"
  #   	total_units = investment / nav_at_purchase
  #   	puts "Initial Investment: #{total_units} units"

  #   ## Dividend rate announcement, if applicable
  #   	dividend_rate = rand(0..0.07)
  #   	updated_total_units = total_units * (1 + dividend_rate)
  #   	puts "Dividend announce is: #{dividend_rate}"
  #   	puts "With the dividend obtained, total units now is: #{updated_total_units}"

  #   ## Change the price of the nav 
  #   	starting_gate = nav_at_purchase - 0.1
  #   	ending_gate = nav_at_purchase + 0.1

  #  		update_nav_value = rand(starting_gate..ending_gate)
  #   	current_value = updated_total_units * update_nav_value
     
  #   	puts "the new nav price is now: #{update_nav_value}"
  #   	puts "total value of investment in RM: #{current_value}"

  #   ## Calculate the ROI, annualized return
  #   	period_starting_balance = funds
  #   	period_ending_balance = current_value
  #   	duration = 1

  #    	rate = exp(log(period_ending_balance.to_f / period_starting_balance.to_f) / duration) - 1

  #       puts "Annualized rate of return " + (rate*100).round(2).to_s + "%"
  #   else
  #  		puts "..ending code"
  #   end
  # end

end
