class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :encrypted_password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :kana_first_name, presence: true, format: {with: /\A[\p{katakana}\u{30fc}]+\z/ }
  validates :kana_last_name, presence: true, format: {with: /\A[\p{katakana}\u{30fc}]+\z/ }
  validates :birthday, presence: true

  has_many :products
  #has_many :purchases

end
