class UsersController < Clearance::UsersController
	def show
		if current_user.nil?
			redirect_to sign_in_path
		end
	end
end
