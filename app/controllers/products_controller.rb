class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.includes(:user).order("created_at DESC")
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

  def show
  end

  def edit
    if user_signed_in? && current_user.id != @product.user.id
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @product.user.id
    @product.destroy
    end
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :product_explain, :category_id, :condition_id, :fee_load_id, :prefecture_id, :send_by_id, :price).merge(user_id: current_user.id)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
