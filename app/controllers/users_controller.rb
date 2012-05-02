class UsersController < ApplicationController

  before_filter :check_login
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.order(:username)
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def create 
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @user = current_user
  end

  def attend
      @user = User.find(session[:user_id])
  end
end
