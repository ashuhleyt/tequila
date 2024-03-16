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

  private
  def bar_params
    params.permit(:name, :minimum_age, :rating)
  end
end