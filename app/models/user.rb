class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,
    presence: true
  validates :family_name,
    format: { with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ },
    presence: true
  validates :first_name,
    format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ },
    presence: true
  validates :family_name_kana,
    format: { with: /\A[ァ-ヶー]+\z/ },
    presence: true
  validates :first_name_kana,
    format: { with: /\A[ァ-ヶー]+\z/ },
    presence: true
  validates :birthday,
    presence: true
  validates :password,
    format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
end
