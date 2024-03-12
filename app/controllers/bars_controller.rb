class BarsController < ApplicationController 
  def index 
    @bars = Bar.all
  end

  def show 
    @bar = Bar.find(params[:id])
    # require 'pry'; binding.pry
  end
end