class SessionsController < ApplicationController

  def new # get /login
  end

  def create # post /login
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      login_user
      redirect_to breweries_path
    else
      flash.now[:error] = ["Please enter valid username and password"]
      render :new
    end
  end

  def destroy # delete /logout
    session.clear
    redirect_to root_path
  end
end
