class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,       null: false, default: ""
      t.integer    :prefecture_id,     null: false 
      t.string     :city_town_village, null: false, default: ""
      t.string     :street_address,    null: false, default: ""
      t.string     :building_name
      t.string     :contact_number,    null: false, default: ""
      t.references :order,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
