class LikesController < ApplicationController
  
  before_action :logged_in_user
  
  def index
    @items = current_user.liking.page(params[:page]).per(6)
    @count = @items.size
  end
  
  def create
    @item = Item.find(params[:item_id])
    current_user.likes.create(item_id: @item.id)
    redirect_to request.referrer || @item
  end
  
  def destroy
    @item = Like.find(params[:id]).item
    current_user.likes.find_by(item_id: @item.id).destroy
    redirect_to request.referrer || @item
  end
end
