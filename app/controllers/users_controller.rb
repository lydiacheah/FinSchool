class UsersController < Clearance::UsersController
	before_action :set_user_and_profile, except: :home
	before_action :check_user, only: :edit

	def home
		if current_user.nil?
			redirect_to sign_in_path
    elsif current_user.nickname.nil? || current_user.birthday.nil?
      redirect_to edit_user_path(current_user)
		else
      redirect_to games_path
    end
	end

	def show
	end

	def edit
	end

  def update
    if @user.update_attributes(user_params)
      @profile.update_attributes(financial_goal: profile_params[:financial_goal][/\d+/])
      redirect_to home_path
    else
     redirect_to edit_user_path(@user), flash:{danger: @user.errors.values.first}
    end
  end

  private

  def check_user
    unless @user == current_user
      redirect_to sign_in_path, flash:{danger: "You are not authorized to view that page."}
    end
  end

  def set_user_and_profile
    @user = User.find(params[:id])
    @profile = @user.profiles.find_by(active: true)
  end

  def user_params
    params.require(:user).permit(:name, :email, :nickname, :birthday, :password)
  end

  def profile_params
    params.require(:profile).permit(:financial_goal)
  end
  
end
