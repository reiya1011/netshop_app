class AdminController < ApplicationController
  
  #　管理者かチェックする
  before_action :admin_user, only: [:home, :private_items]
    
  
  def home
    unless logged_in? && current_user.admin?
      redirect_to root_path
    else
     @items = Item.page(params[:page]).per(10)
    end
  end  
  
  
  def private_items
   @items = Item.page(params[:page]).per(10)
  end
  
end
