class PurchaseController < ApplicationController
    
    before_action :specific_info, :inventory_check, only: [:create]
    before_action :logged_in_user, only: [:index, :show]
    before_action :admin_user, only: [:index, :show]
    
    def index
     @infos = BuyInfo.page(params[:page]).per(10)
    end
    
    
    def show
     @user_info = UInfo.find_by(id: params[:id])
     @buy_infos = BuyInfo.where(u_info_id: @user_info.id).page(params[:page]).per(5)
    end
    
    
    def create
     @items.each do |item|
      @cart_item = CartItem.find_by(cart_id: current_cart, item_id: item.id)
      @buy_info = BuyInfo.new(u_info_id: @user_info.id, item_id: item.id)
      @buy_info.quantity = @cart_item.quantity[0].count
      @buy_info.save
      item.stocks = item.stocks - @cart_item.quantity[0].count
      item.save
      @cart_item.destroy
     end
      flash[:success] = "注文が確定がしました"
      redirect_to root_path
    end
    
    
    
    def history 
     @info = current_user.u_info
     if @info.empty?
      flash[:success] = "購入履歴はありません"
      redirect_to request.referrer || user_path
     else
      @buy_infos = BuyInfo.where(u_info_id: @info[0].id).page(params[:page]).per(3)
      if @buy_infos.empty?
       flash[:success] = "購入履歴はありません"
       redirect_to request.referrer || user_path
      end
     end
    end
    
    
    
    private
    
    def specific_info
       if ShoppingInfo.find_by(cart_id: current_cart.id).nil?
         flash[:danger] = "配送先情報を登録してください"
         redirect_to request.referrer || root_url
       else
         @user_info = current_cart.u_info[0]
         @items = current_cart.in_item
       end
    end
    
    def inventory_check
     @out_of_stock = []
     @items.each do |item|
      @cart_item = CartItem.find_by(cart_id: current_cart, item_id: item.id)
      if item.stocks < @cart_item.quantity[0].count
       @out_of_stock <<  item.id
       flash[item.id.to_s] = "※在庫が残り#{item.stocks}個です"
      end
     end
     if @out_of_stock.any?
      flash[:danger] = "在庫が足りない商品がります"
      redirect_back(fallback_location: root_path)
     end
    end
    
end
