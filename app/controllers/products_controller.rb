class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :product_explain, :category_id, :condition_id, :fee_load_id, :prefecture_id, :send_by_id, :price).merge(user_id: current_user.id)
  end
end
