class CreateHistoryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :history_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
