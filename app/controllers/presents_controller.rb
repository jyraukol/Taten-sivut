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
end
