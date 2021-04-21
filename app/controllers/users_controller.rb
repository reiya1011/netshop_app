class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:index, :show, :update, :destroy]
  before_action :correct_user, only: [:show, :update, :destroy]
  before_action :admin_user, only: [:index]

  
  def index
    @users = User.page(params[:page]).per(10)
  end
  
  def show
    @user = User.find(params[:id])
    if @shopping_info = ShoppingInfo.find_by(cart_id: current_cart.id)
      @info = @shopping_info.u_info
      @items = @info.in_item
    end
  end
  
  def create 
    @user = User.new(user_params)
    @user.admin = true
    if @user.save
      @user.cart.create
      @user.send_activation_email
      # なぜかログインしてしまうため
      session.delete(:user_id)
      @current_user = nil
      flash[:success] = "入力されたアドレスに本人認証メールを送りました"
      redirect_to root_path
    else
       flash[:user_create_error] = "正しい情報を入力してください"
       redirect_to root_path
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "アカウント情報が変更されました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = current_user
    log_out
    @user.destroy
    flash[:success] = "アカウントを退会しました"
    redirect_to root_path
  end
  
  
  private
  
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
end
