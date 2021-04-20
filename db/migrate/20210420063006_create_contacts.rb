class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :subject
      t.text :contents
      t.boolean :check, default: false
      t.timestamps
    end
  end
end
