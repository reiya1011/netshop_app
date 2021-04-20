class CreateItemQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :item_quantities do |t|
      t.references :item, null: false, foreign_key: true
      t.references :quantity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
