class PresentsController < ApplicationController
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
    Present.update(params[:present], :reserved => value)
    redirect_to presents_index_url
    
  end
end
