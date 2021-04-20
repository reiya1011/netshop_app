class ReleaseController < ApplicationController
  
  before_action :logged_in_user, only: [:show, :destroy]
  before_action :admin_user, only: [:show, :destroy]
  
  def show
    @item = Item.find_by(id: params[:id])
    @item.release = true
    @item.save
    flash[:success] = "商品が公開されました"
    redirect_to request.referrer || items_path
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.release = false
    @item.save
    flash[:danger] = "商品を非公開にしました"
    redirect_to request.referrer || items_path
  end
end
