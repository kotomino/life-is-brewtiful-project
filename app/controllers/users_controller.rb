class UsersController < ApplicationController
  
  def new
    redirect_if_logged_in
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      login_user
      redirect_to breweries_path
    else 
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def profile
    redirect_if_not_logged_in
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :image)
  end

  
end
