class Users::RegistrationsController < Devise::RegistrationsController

  skip_after_action :verify_authorized

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to Blocmarks!"
      sign_in(@user)
      redirect_to root_path

    else
      flash.now[:alert] = "There was an error creating your account.  Please try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
