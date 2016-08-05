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
		s_rates = [rate1, rate2, rate3, rate4, rate5].to_json
	end
end
