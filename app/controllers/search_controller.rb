class SearchController < ApplicationController
    
  def index
   @items = Item.search(params[:search])
   if @items.empty?
     flash[:danger] = "アイテムが見つかりません"
     redirect_to request.referrer || root_url
   end
  end
  
end
