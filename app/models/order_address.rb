class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code,:prefecture_id, :city_town_village, :street_address, :building_name, :contact_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_town_village
    validates :street_address
    validates :contact_number, format: {with: /\A\d{10,11}\z/ }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code:       postal_code, 
      prefecture_id:     prefecture_id, 
      city_town_village: city_town_village, 
      street_address:    street_address, 
      building_name:     building_name, 
      contact_number:    contact_number, 
      order_id:          order.id)
  end

end


