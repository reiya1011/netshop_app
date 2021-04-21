class UserInfoController < ApplicationController
 
 def create 
  @u_info = UInfo.new(u_info_params)
  if @u_info.save
   if logged_in?
    @u_info.user_info.create(user_id: current_user.id)
    @u_info.shopping_info.create(cart_id: current_cart.id)
    flash[:success] = "情報が登録されました"
    redirect_to current_user
   else
    @u_info.shopping_info.create(cart_id: current_cart.id)
    flash[:success] = "情報が登録されました"
    redirect_to current_user
   end
  else
   flash[:danger] = "情報の登録に失敗しました。入力に誤りがあります"
   redirect_to request.referrer || new_user_info_path
  end
 end
 
 def update
  @shopping_info = ShoppingInfo.find_by(cart_id: current_cart.id)
  @info = @shopping_info.u_info
  if @info.update(u_info_params)
   flash[:success] = "情報が更新されました"
   redirect_to current_user
  else 
   flash[:danger] = "情報の更新に失敗しました。入力に誤りがあります"
   redirect_to request.referrer || edit_user_info_path
  end
   
 end
 
 
  private
 
   def u_info_params
      params.permit(:name, :phone_number, :postal_code, :prefectures, :municipal_district, :street_bunch, :building_name)
   end
   

  
 
end