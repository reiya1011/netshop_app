class StaticPagesController < ApplicationController
  
  def home
   @items = current_cart.history if current_cart
   @recommendations = Item.last(10)if @items.empty?
  end

  def about
  end

  def contact
    @contact = Contact.new
  end
  
end
