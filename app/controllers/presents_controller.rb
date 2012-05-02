class PresentsController < ApplicationController
  before_filter :check_login

  def index
    @presents = Present.order("name").all
  end

  def new
    @present = Present.new
  end

  def create
    @present = Present.new(params[:present])
    if @present.save
      redirect_to manage_presents_path 
    else
      render "new"
    end
  end
  
  def edit 
    @present = Present.find(params[:id]) 
  end

  def destroy 
    @present = Present.find(params[:id])
    @present.destroy
    redirect_to manage_presents_path
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

  def manage
    check_admin
    @presents = Present.all
  end

end
