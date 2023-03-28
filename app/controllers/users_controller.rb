class UsersController < UserController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    raise
    if @user.save
      if @user.account_type == "user"
        redirect_to user_path(current_user)
      elsif @user.account_type == 'business'

        redirect_to new_business_path(current_user)
      end
    else
      # handle errors
    end
  end

  def sign_out
    sign_out current_user
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @token = Token.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :banner, :account_type, :photo, :email, :password)
  end
end
