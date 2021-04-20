class QuantitysController < ApplicationController
   
  def update
    @item = Item.find(params[:item_id])
    @cart_item = CartItem.find_by(cart_id: current_cart.id, item_id: @item.id)
    @quantity = @cart_item.quantity[0]
    @quantity.update(quantity_params)
    redirect_to current_cart
  end
  
  private
  
   def quantity_params
     params.require(:quantity).permit(:count)
   end
   
   def item_params
     params.require(:quantity).permit(:item_id)
   end
   
   def inventory_check
     @quantity = Quantity.new(quantity_params)
     @quantity_count = @quantity.count
     @item = Item.find_by(item_params)
     if @item.stocks < @quantity_count
      flash[@item.id.to_s] = "※在庫が残り#{@item.stocks}個です"
      flash[:danger] = "在庫が足りません"
      redirect_back(fallback_location: root_path)
     end
   end
  
end
