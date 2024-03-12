class DrinksController < ApplicationController 
  def index 
    @bar = Bar.find_by(params[:id])
    @drinks = Drink.all
  end
end