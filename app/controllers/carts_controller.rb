class CartsController < ApplicationController
  
  before_action :corrent_cart, only: [:show]
  before_action :set_method, :cart_check, only: [:show]
  before_action :cart_initem_count_check, only: [:create]
   
  def show
   @cart_items.each do |item|
     @cart_item = CartItem.find_by(cart_id: @cart.id, item_id: item.id)
     @item_price << item.price * @cart_item.count
   end
  end
   
  def create
     @item = Item.find(params[:item_id])
      if !current_cart.in_item.include?(@item)
       current_cart.cart_item.create(item_id: @item.id)
       flash[:success] = "ショッピングバッグに追加しました"
       redirect_to request.referrer || current_cart
      else
       redirect_to request.referrer || current_cart
      end
  end

  def destroy
   @item = current_cart.cart_item.find_by(item_id: params[:item_id])
   @item.destroy
   if current_cart.in_item.empty?
     flash[:danger] = "カートの中身は空です"
     redirect_to root_path
   else
     redirect_to current_cart
   end
  end
  
  def update
    @item = Item.find(params[:item_id])
    @cart_item = CartItem.find_by(cart_id: current_cart.id, item_id: @item.id)
    @cart_item.update(count_params)
    redirect_to current_cart
  end
   
   private
   
   def count_params
     params.require(:cart).permit(:count)
   end
   
   def item_params
     params.require(:cart).permit(:item_id)
   end
   
   #　自身のカートかチェック
   def corrent_cart
     @cart = Cart.find(params[:id])
     redirect_to current_cart unless current_cart?(@cart)
   end
   
   # 複数の値を取得
   def set_method
     @cart = Cart.find(params[:id])
     @cart_items = @cart.in_item
   end
   
   # カートの中身が空なら拒否
   def cart_check
     if current_cart.in_item.empty?
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
