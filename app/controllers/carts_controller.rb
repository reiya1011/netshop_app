class CartsController < ApplicationController
  
  before_action :corrent_cart, only: [:show]
  before_action :set_method, :cart_check, only: [:show]
  before_action :cart_initem_count_check, only: [:create]
 
   
  def show
   @all_items.each do |item|
     @cart_item = CartItem.find_by(cart_id: @cart.id, item_id: item.id)
     @item_price << item.price * @cart_item.cart_quantity[0].quantity.count
     @items << item
   end
   @price = @item_price.sum
   
  end
   

  def create
     @item = Item.find(params[:item_id])
      if !current_cart.in_item.include?(@item)
       @cart_item = current_cart.cart_item.create(item_id: @item.id)
       @quantity = Quantity.create
       @cart_item.cart_quantity.create(quantity_id: @quantity.id)
        flash[:success] = "ショッピングバッグに追加しました"
       redirect_to request.referrer || current_cart
      else
       redirect_to request.referrer || current_cart
      end
  end

  def destroy
   @item = current_cart.cart_item.find_by(item_id: params[:item_id])
   @item.destroy
   @all_items = current_cart.in_item
    if @all_items.empty?
     flash[:danger] = "カートの中身は空です"
     redirect_to root_path
    else
     redirect_to current_cart
    end
  end
   
   private
   
   #　自身のカートかチェック
   def corrent_cart
     @cart = Cart.find(params[:id])
     redirect_to current_cart unless current_cart?(@cart)
   end
   
   # 複数の値を取得
   def set_method
     @cart = Cart.find(params[:id])
     @all_items = @cart.in_item
     @items = []
     @item_price = []
   end
   
   # カートの中身が空なら拒否
   def cart_check
     @all_items = current_cart.in_item
     if @all_items.empty?
      flash[:danger] = "カートの中身は空です"
      redirect_back(fallback_location: root_path)
     else
      @items = []
      @item_price = []
     end
   end
   
   # 5つ以上の商品をカートに追加できないようにする
   def cart_initem_count_check
    if current_cart.in_item.count >= 5
     flash[:danger] = "これ以上ショッピングバッグに商品を追加できません"
     redirect_to request.referrer || current_cart
    end
   end
   
end
