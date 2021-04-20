class ShoppingController < ApplicationController
    
  before_action :set_method, :inventory_check, only: [:order, :show]
  before_action :u_info, only: [:show, :order, :update]
  
  def show
   @all_items.each do |item|
    @cart_item = CartItem.find_by(cart_id: current_cart.id, item_id: item.id)
    @item_price << item.price * @cart_item.cart_quantity[0].quantity.count
    @items << item
   end
   @price = @item_price.sum
  end
      
  def create 
  @u_info = UInfo.new(u_info_params)
  if @u_info.save
   if logged_in?
    @u_info.user_info.create(user_id: current_user.id)
    @u_info.shopping_info.create(cart_id: current_cart.id)
    redirect_to order_shopping_index_path
   else
    @u_info.shopping_info.create(cart_id: current_cart.id)
    redirect_to order_shopping_index_path
   end
  else
   flash[:user_info_danger] = "情報の登録に失敗しました。入力に誤りがあります"
   redirect_to request.referrer || shopping_path(current_cart)
  end
  end
 
  def update
 
   if @info.update(u_info_params)
    redirect_to order_shopping_index_path
   else 
    flash[:danger] = "情報の更新に失敗しました。入力に誤りがあります"
     redirect_to request.referrer || shopping_path(current_cart)
   end
   
  end
  
  def order
   @all_items.each do |item|
     @cart_item = CartItem.find_by(cart_id: current_cart.id, item_id: item.id)
     @item_price << item.price * @cart_item.cart_quantity[0].quantity.count
     @items << item
    end
   @price = @item_price.sum
   @user_info = current_cart.u_info[0]
  end
  
  
  private
  
   def u_info_params
      params.permit(:name, :phone_number, :postal_code, :prefectures, :municipal_district, :street_bunch, :building_name)
   end
 
   def u_info
    if @shopping_info = ShoppingInfo.find_by(cart_id: current_cart.id)
      @info = @shopping_info.u_info
    end
   end
   
   def set_method
     @all_items = current_cart.in_item
     if @all_items.empty?
      flash[:danger] = "カートの中身は空です"
      redirect_back(fallback_location: root_path)
     else
      @items = []
      @item_price = []
     end
   end
   
   def inventory_check
    @out_of_stock = []
    @all_items.each do |item|
     @cart_item = CartItem.find_by(cart_id: current_cart, item_id: item.id)
     if item.stocks < @cart_item.quantity[0].count
      @out_of_stock <<  item.id
      flash[item.id.to_s] = "残り#{item.stocks}個です"
     end
    end
    if @out_of_stock.any?
     flash[:danger] = "在庫が足りない商品がります"
     redirect_to current_cart
    end
   end
    
   
end
