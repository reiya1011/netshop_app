module CartsHelper
    
  def current_cart
    if logged_in?
      @current_cart ||= Cart.find_by(user_id: current_user.id)
    else
      if session[:cart_id]
       if @cart = Cart.find_by(id: session[:cart_id])
         @current_cart ||= @cart
       else
         session.delete(:cart_id)
       end
      else
       @current_cart = Cart.create
       session[:cart_id] = @current_cart.id
      end
    end
  end
  
  def current_cart?(cart)
      cart && cart == current_cart
  end
  
  
end
