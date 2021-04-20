class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :content
      t.integer :price
      t.integer :stocks, default: 0
      t.string :gender
      t.string :category

      t.timestamps
    end
  end
end
