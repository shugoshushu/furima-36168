class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  
  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: {with: /\A[\p{katakana}\u{30fc}]+\z/ } do
    validates :kana_first_name
    validates :kana_last_name
  end

  #has_many :products
  #has_many :purchases

end
