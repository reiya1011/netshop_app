class CreateUserInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :u_info, null: false, foreign_key: true
      t.timestamps
    end
  end
end
