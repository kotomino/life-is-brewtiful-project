class ApplicationController < ActionController::Base

  helper_method :user_signed_in?, :current_user
  
  def user_signed_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by_id(session[:user_id]) if user_signed_in?
  end

  def login_user
    session[:user_id] = @user.id
  end

  def redirect_if_not_logged_in
    flash[:error] = ["You're not logged in."] unless user_signed_in?
    redirect_to login_path unless user_signed_in?
  end

  def redirect_if_logged_in
    flash[:error] = ["You're already logged in."] if user_signed_in?
    redirect_to breweries_path if user_signed_in?
  end

  def redirect_if_not_owner
    redirect_to breweries_path unless @rating.user == current_user
  end
end
