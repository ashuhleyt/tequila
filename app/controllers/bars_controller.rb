class BarsController < ApplicationController 
  def index 
    @bars = Bar.ordered_by_creation_time
  end

  def show 
    @bar = Bar.find(params[:id])
  end
end