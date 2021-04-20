class ItemsController < ApplicationController
  
  include ItemsHelper
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :title_check, only: [:woman, :mens]
  
  
  
  def index
    @items = Item.all
  end
  

  def show
    @item = Item.find(params[:id])
    @cart = current_cart
    user_history
    @info = @item.info[0]
  end
  
  def new
    @item = Item.new
  end
  
  
  # 商品を商品ジャンルを紐付けして作成
  def create
   @item = Item.new(item_params)
   @info = Info.find_by(info_params)
   if @info
    if @item.save
     @info.item_info.create(item_id: @item.id)
     flash[:success] = "商品が登録されました"
     redirect_to new_item_path
    else
     flash.now[:danger] = "登録内容に不備があります"
     render 'new' 
    end
    
   else
    @info = Info.new(info_params)
    if @info.save
     if @item.save
      @info.item_info.create(item_id: @item.id)
      flash[:success] = "商品が登録されました"
      redirect_to new_item_path
     else
      flash.now[:danger] = "登録内容に不備があります"
      render 'new' 
     end
    else
     flash.now[:danger] = "登録内容に不備があります"
     render 'new' 
    end
   end
   
  end
  
  

  def edit
    @item = Item.find(params[:id])
  end
  
  
  
  def update
    @item = Item.find(params[:id])
    @info = Info.find_by(info_params)
    
    #　@infoが存在する場合
    if @info
     # @itemが更新できる場合　
     if @item.update(item_params)
      @item.info.update(info_params)
      flash[:success] = "商品情報が変更されました"
      redirect_to @item
     # @itemが更新できない場合
     else
      flash.now[:danger] = "変更内容に不備があります"
      render 'edit'
     end
     
     
    # @infoが存在しない場合
    else
     @info = Info.new(info_params)
     if @info.save
      # @itemが更新できる場合　
      if @item.update(item_params)
        @item.info.update(info_params)
        flash[:success] = "商品情報が変更されました"
        redirect_to @item
      # @itemが更新できない場合
      else
       flash.now[:danger] = "変更内容に不備があります"
       render 'edit'  
      end
     else
      flash.now[:danger] = "変更内容に不備があります"
      render 'edit'  
     end
    end
  end
  
  
  
  def destroy
    Item.find(params[:id]).destroy
    flash[:danger] = "商品を削除しました"
    redirect_back(fallback_location: admin_home_path)
  end
  
  
  
  def new_work
    @all_items = Item.all
    @items = []
    @all_items.each do |item|
     unless item.created_at < 24.month.ago
       @items << item
     end
    end
    @count = 0
    @items.each do |n|
     @count += 1 if n.release?
    end
  end
  
  
  def woman
    @info = Info.where(gender: "woman", category: params[:item_id])
    @items = []
    @info.each do |info|
     @items += info.in_item
    end
    @count = 0
    @items.each do |n|
     @count += 1 if n.release?
    end
  end
  
  
  def mens
    @info = Info.where(gender: "mens", category: params[:item_id])
    @items = []
    @info.each do |info|
     @items += info.in_item
    end
    @count = 0
    @items.each do |n|
     @count += 1 if n.release?
    end
  end
  
  private

    def item_params
      params.require(:item).permit(:name, :content, :price, :stocks, :image, images: [])
    end
    
    def info_params
      params.require(:item).permit(:gender, :category)
    end
    
    # タイトルを特定する
    def title_check 
      if params[:item_id] == "bag"
        @title = "バッグ"
      elsif params[:item_id] == "clothes"
        @title = "洋服"
      elsif params[:item_id] == "wallet"
        @title = "財布&小物"
      elsif params[:item_id] == "accessories"
        @title = "アクセサリー"
      elsif params[:item_id] == "shoes"
        @title = "シューズ"
      elsif params[:item_id] == "perfume"
        @title = "フレグランス"
      end
    end
end
  

