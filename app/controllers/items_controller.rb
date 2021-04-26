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
  end
  
  def new
    @item = Item.new
  end
  
  
  def create
   @item = Item.new(item_params)
   if @item.save
     flash[:success] = "商品が登録されました"
     redirect_to new_item_path
   else
     flash.now[:danger] = "登録内容に不備があります"
     render 'new' 
   end
  end
  
  

  def edit
    @item = Item.find(params[:id])
  end
  
  
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "商品情報が変更されました"
      redirect_to @item
    else
      flash.now[:danger] = "変更内容に不備があります"
      render 'edit'
    end
  end
  
  
  
  def destroy
    Item.find(params[:id]).destroy
    flash[:danger] = "商品を削除しました"
    redirect_back(fallback_location: admin_home_path)
  end
  
  
  #新作商品(2年で設定)ページ
  def new_work
    @all_items = Item.last(30)
    @items = []
    @count = 0
    @all_items.each do |item|
     unless item.created_at < 24.month.ago
       @items << item
       @count += 1
     end
    end
  end
  
  #女性向け商品ページ
  def woman
    @items = Item.where(gender: "woman", category: params[:item_id])
    @count = @items.count
  end
  
  #男性向け商品ページ
  def mens
    @items = Item.where(gender: "mens", category: params[:item_id])
    @count = @items.count
  end
  
  private

    def item_params
      params.require(:item).permit(:name, :content, :price, :stocks, :gender, :category, :image, images: [])
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
  

