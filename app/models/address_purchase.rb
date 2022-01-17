class AddressPurchase
  include Activemodel: :Model
  attr_accessor :post_code, :prefecture, :city, :address, :building_name, :number, :user_id, :product_id
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :user_id
    validates :product_id
  end

  validates :prefecture, numericality: { other_than: 1 , message: "can't be blank"}
  validates :number, format: {with: /\A\d{10,11}\z/ , message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building_name: building_name, number: number, purchase_id: purchase.id)
  end

end