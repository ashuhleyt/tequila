class DrinksController < ApplicationController 
  def index 
    @bar = Bar.find_by(params[:id])
    @drinks = Drink.all
  end

  def show 
    @drink = Drink.find(params[:id])
  end
end