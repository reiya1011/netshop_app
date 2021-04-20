class CreateQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :quantities do |t|
      t.integer :count, default: 1
      t.timestamps
    end
  end
end
