class AdminController < ApplicationController
  
  #　管理者かチェックする
  before_action :admin_user, only: [:home, :private_items]
    
  
  def home
   @items = Item.page(params[:page]).per(10)
  end  
  
  
  def private_items
   @items = Item.page(params[:page]).per(10)
  end
  
end
