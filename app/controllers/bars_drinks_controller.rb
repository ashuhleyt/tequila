class BarsDrinksController < ApplicationController 
  def index 
    @bar = Bar.find(params[:id])
    @drinks = @bar.drink
  end

  def new 
    @bar = Bar.find(params[:id])
  end

  def create 
    @bar = Bar.find(params[:id])
    @new_drink = @bar.drink.create!(bar_drink_params)
    redirect_to "/bars/#{@bar.id}/drinks"
  end

  private
  def bar_drink_params
    params.permit(:name, :proof, :made_in_mexico)
  end
end