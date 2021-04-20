class HistoryController < ApplicationController
  
  def show
   @history = History.find(params[:id])
   @items = @history.in_item
  end
    
end
