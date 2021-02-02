class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_id(params[:user][:username])
    if !@user
      @error = "Username is incorrect"
      render :new
    elsif !user.authenticate(params[:user][:password])
      @error = "Password is incorrect"
      render :new
    else
      session[:user_id] = @user.id
    end
  end

  
end
