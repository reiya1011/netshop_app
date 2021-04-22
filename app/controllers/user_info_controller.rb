class UserInfoController < ApplicationController
 
 def create 
  @u_info = UInfo.new(u_info_params)
  if @u_info.save
    current_cart.user_info.create(u_info_id: @u_info.id)
    flash[:success] = "情報が登録されました"
    redirect_to current_user
  else
   flash[:danger] = "情報の登録に失敗しました。入力に誤りがあります"
   redirect_to request.referrer || new_user_info_path
  end
 end
 
 def update
  @user_info = UserInfo.find_by(cart_id: current_cart.id)
  @info = @user_info.u_info
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