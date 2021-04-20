module ItemsHelper
  
  # ユーザーの閲覧履歴を取得
  def user_history   
   if HistoryItem.find_by(cart_id: @cart.id, item_id: @item.id).nil?
    HistoryItem.create(cart_id: @cart.id, item_id: @item.id)
   end
  end
  
end
