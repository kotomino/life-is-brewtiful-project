class SessionsController < ApplicationController

  def new # get /login
    redirect_if_logged_in
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

  def google
    @user = User.find_or_create_by(email: auth["email"], first_name: auth["first_name"], last_name: auth["last_name"]) do |user|
      user.password = SecureRandom.hex(10)
    end
    if @user && @user.id #if user exists and is saved 
      login_user
      redirect_to breweries_path
    else
      redirect_to signup_path
    end
  end

  def facebook
    @user = User.find_or_create_by(email: auth["email"], first_name: fb_first_name, last_name: fb_last_name) do |user|
      user.password = SecureRandom.hex(10)
    end 
    if @user && @user.id #if user exists and is saved 
      login_user
      redirect_to breweries_path
    else
      redirect_to signup_path
    end
  end

  private

  def auth
    request.env["omniauth.auth"]["info"]
  end

  def fb_first_name
    auth["name"].split(" ").first
  end

  def fb_last_name
    auth["name"].split(" ").last
  end

end
