class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # 下記のモデルはまだ作成していないため保留（10/05）
  # has_one    :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_duration

  validate  :image_presence
  validates :item_name,            presence: true
  validates :description,          presence: true
  validates :category_id,          numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id,         numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_cost_id,     numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id,        numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_duration_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :sales_price,          presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer:true }
  private

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
