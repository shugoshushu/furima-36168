class Product < ApplicationRecord

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :fee_load
  belongs_to :send_by

  with_options presence: true do
    validates :product_name
    validates :product_explain
    validates :image
  end
  
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :fee_load_id
    validates :prefecture_id
    validates :send_by_id
  end

  with_options numericality: {only_integer: true, greater_than_or_epual_to: 300, less_than_or_equal_to: 9_999_999 }, presence: true do
    validates :price
  end
end
