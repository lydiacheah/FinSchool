class UsersController < Clearance::UsersController
	before_action :set_user, except: :home
	before_action :check_user, only: :edit

	def home
		if current_user.nil?
			redirect_to sign_in_path
		end
	end

	def show
	end

	def edit
	end

  def update
    if @user.update_attributes(user_params)
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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :nickname, :birthday)
  end
  
end
