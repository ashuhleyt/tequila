class BarsController < ApplicationController 
  def index 
    @bars = Bar.ordered_by_creation_time
  end

  def show 
    @bar = Bar.find(params[:id])
  end

  def new 

  end

  def create 
    bar = Bar.create!(bar_params)
    redirect_to "/bars"
  end

  def edit 
    @bar = Bar.find(params[:id])
  end

  def update 
    bar = Bar.find(params[:id])
    bar.update(bar_params)
    redirect_to "/bars/#{bar.id}"
  end

  private
  def bar_params
    params.permit(:name, :minimum_age, :rating)
  end
end