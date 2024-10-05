class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_duration

  validates :item_name,            presence: true
  validates :description,          presence: true
  validates :category_id,          numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id,         numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_cost_id,     numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id,        numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_duration_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :sales_price,          presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },  format: {with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, on: :create}
  validates :user,                 presence: true
  
  belongs_to :user
  # 下記のモデルはまだ作成していないため保留（10/05）
  # has_one    :purchase_record
end
