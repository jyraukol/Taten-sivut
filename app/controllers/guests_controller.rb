class GuestsController < ApplicationController
  before_filter :check_login
  def new 
    @guest = Guest.new
    @user  = User.find(params[:user_id])
  end

  def create
    user = User.find(params[:user_id])
    @guest = user.guests.build(params[:guest])
    if @guest.save
      redirect_to root_url
    else
      render "new"
    end
  end

end
