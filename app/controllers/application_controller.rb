class ApplicationController < ActionController::Base
  
  before_action :current_cart
  before_action :set_contact_count
  before_action :set_cart_count
  before_action :set_shipping_count
  
  include SessionsHelper
  include CartsHelper
  include HistoryHelper
  
  helper_method :current_cart
  helper_method :current_history
  
  private
    
    # ログインせずにログインが必要なページに来た際に,URLを記憶してログインを促す
    def logged_in_user
      unless logged_in?
        store_location
        flash[:login_error] = "ログインする必要があります"
        redirect_to request.referrer || root_path
      end
    end
    
    #どのページにいてもカートの在庫を取得
    def set_cart_count
     if current_cart
       @carts = CartItem.where(cart_id: current_cart.id)
       @count = []
       @carts.each do |cart|
        @count << cart.count
       end
       @cart_counts = @count.sum
     end
    end
    
    # 管理者でなければ拒否
    def admin_user
      unless logged_in?
       redirect_to(root_url)
      else
       redirect_to(root_url) unless current_user.admin?
      end
    end
    
    #問い合わせの数を取得
    def set_contact_count
      @contact_count = Contact.where(check: false).count
    end
    
    # 発送できていない購入を取得
    def set_shipping_count
      @items = BuyInfo.where(shipping: false)
      @shipping_count = []
      @items.each do |item|
        @shipping_count << item.quantity
      end
      @shipping_counts = @shipping_count.sum
    end
  
end