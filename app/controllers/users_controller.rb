class UsersController < ApplicationController

  before_filter :check_login
  
  def new
    @user = User.new
  end

  def create 
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def attend
    if check_login()
      @user = User.find(session[:user_id])
    else
      redirect_to root_url, :notice => "Log in first"
    end
  end
end
