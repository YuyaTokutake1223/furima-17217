class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :last_name,           presence: true
  validates :last_name_furigana,  presence: true
  validates :first_name,          presence: true
  validates :first_name_furigana, presence: true
  validates :birthday,            presence: true

# 下記のモデルはまだ作成していないため保留（10/03）
  # has_many :products
  # has_many :purchase_records
  
end
