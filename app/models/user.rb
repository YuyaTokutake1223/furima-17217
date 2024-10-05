class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname,            presence: true
  validates :birthday,            presence: true
  validates :last_name,           presence: true, format: {with: NAME_REGEX,     on: :create}  
  validates :first_name,          presence: true, format: {with: NAME_REGEX,     on: :create}
  validates :last_name_furigana,  presence: true, format: {with: KANA_REGEX,     on: :create}
  validates :first_name_furigana, presence: true, format: {with: KANA_REGEX,     on: :create}
  validates :password,                            format: {with: PASSWORD_REGEX, on: :create}
  

  has_many :items
  # 下記のモデルはまだ作成していないため保留（10/03）
  # has_many :purchase_records
  
end
