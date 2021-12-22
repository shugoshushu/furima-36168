require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '出品' do
    context '出品ができる場合' do
      it 'すべての項目が入力されている' do
        expect(@product).to be_valid
      end
    end

    context '出品ができない場合' do
      it 'product_nameが空だと出品できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_explainが空だと出品できない' do
        @product.product_explain = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product explain can't be blank")
      end
      it 'catefory_idが空だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空だと出品できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it 'fee_load_idが空だと出品できない' do
        @product.fee_load_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Fee load can't be blank")
      end
      it 'prefecture_idが空だと出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'send_by_idが空だと出品できない' do
        @product.send_by_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Send by can't be blank")
      end
      it 'category_idで1が選択されていると出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idで1が選択されていると出品できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it 'fee_load_idで1が選択されていると出品できない' do
        @product.fee_load_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Fee load can't be blank")
      end
      it 'prefecture_idで1が選択されていると出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'send_by_idで1が選択されていると出品できない'  do
        @product.send_by_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Send by can't be blank")
      end
      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '価格が空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が半角数字入力でないと出品できない' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it '価格が300円未満では出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include
      end
      it '価格が9_999_999円を超えると出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include
      end
      it 'userが紐付いていなければ出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
    end
  end
end
