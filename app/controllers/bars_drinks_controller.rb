class BarsDrinksController < ApplicationController 
  def index 
    @bar = Bar.find(params[:id])
    @drinks = @bar.drink
  end
end