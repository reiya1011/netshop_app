class StaticPagesController < ApplicationController
  
  before_action :admin_user, only: [:admin]
  
  def home
   @items = current_cart.history if current_cart
   @recommendations = Item.last(10)if @items.empty?
  end

  def contact
    @contact = Contact.new
  end
  
  def about
  end
  
  def admin
   @items = Item.page(params[:page]).per(10)
  end  
  
end
