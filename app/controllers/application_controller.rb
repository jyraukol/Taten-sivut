class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :check_login
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_login
    if current_user == nil 
      return false
    else
      return true
    end
  end
end
