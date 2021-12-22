FactoryBot.define do
  factory :product do
    product_name      {'テストコード'}
    product_explain   {'テストです。説明の欄です。'}
    category_id       {'2'}
    condition_id      {'2'}
    fee_load_id       {'2'}
    prefecture_id     {'2'}
    send_by_id        {'2'}
    price             {'300'}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
