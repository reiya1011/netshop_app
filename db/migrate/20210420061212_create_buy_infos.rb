class CreateBuyInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_infos do |t|
      t.references :item, null: false, foreign_key: true
      t.references :u_info, null: false, foreign_key: true
      t.integer :sent, default: 0
      t.integer :quantity, default: 1
      t.boolean :shipping, default: false
      t.timestamps
    end
  end
end
