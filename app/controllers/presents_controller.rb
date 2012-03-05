class PresentsController < ApplicationController
  before_filter :check_login, :current_user

  def index
    @presents = Present.all
  end

  def new
    @present = Present.new
  end

  def create
    @present = Present.new(params[:present])
    if @present.save
      redirect_to presents_index_url 
    else
      render "new"
    end
  end
  
  def edit 
    @present = Present.find(params[:id]) 
  end

  def update 
    @present = Present.find(params[:id])
    if @present.update_attributes(params[:present])
      redirect_to presents_index_path
    end
  end

  def reserve_present
    value = !Present.find(params[:present]).reserved
    if value == true
      Present.update(params[:present], :reserved => value, :reserver => current_user.id)
    elsif Present.find(params[:present]).reserver == current_user.id
      Present.update(params[:present], :reserved => value, :reserver => nil)
    end
    redirect_to presents_index_url  
  end

end
