class CreateCartQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_quantities do |t|
      t.references :cart_item, null: false, foreign_key: true
      t.references :quantity, null: false, foreign_key: true
      t.timestamps
    end
  end
end
