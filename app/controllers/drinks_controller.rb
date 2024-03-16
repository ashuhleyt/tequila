class DrinksController < ApplicationController 
  def index 
    @bar = Bar.find_by(params[:id])
    @drinks = Drink.all
  end

  def show 
    @drink = Drink.find(params[:id])
  end

  def edit 
    @drink = Drink.find(params[:id])
  end

  def update 
    drink = Drink.find(params[:id])
    drink.update(drink_params)
    redirect_to "/drinks/#{drink.id}"
  end

  private 
  def drink_params
    params.permit(:name, :proof, :made_in_mexico)
  end
end