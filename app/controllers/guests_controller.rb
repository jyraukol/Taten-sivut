class GuestsController < ApplicationController
  
  def new 
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(params[:guest])
    if @guest.save
      redirect_to root_url
    else
      render "new"
    end
  end

end
