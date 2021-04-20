class CreateUInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :u_infos do |t|
      t.string :name
      t.string :postal_code
      t.string :phone_number
      t.string :prefectures
      t.string :municipal_district
      t.string :street_bunch
      t.string :building_name

      t.timestamps
    end
  end
end
