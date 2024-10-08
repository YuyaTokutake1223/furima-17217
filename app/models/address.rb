class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


  validates :postal_code,       presence: true
  validates :prefecture_id,     numericality: { other_than: 1, message: "can't be blank"} 
  validates :city_town_village, presence: true
  validates :street_address,    presence: true
  validates :contact_number,    presence: true

end
