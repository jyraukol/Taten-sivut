class ApplicationController < ActionController::Base
  protect_from_forgery


  helper_method :current_user
  helper_method :check_login
  helper_method :check_admin

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_login
    if current_user == nil 
      redirect_to log_in_url
    end
  end

  def check_admin
    if current_user.admin != true
      redirect_to root_url
    end
  end

end
