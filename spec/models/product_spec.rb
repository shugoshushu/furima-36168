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
    end
  end
end
