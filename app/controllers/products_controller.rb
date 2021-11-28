class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def index
  end

  def new
    @product = Product.new
  end

  def create
    
  end

  private

  def product_params
    params.repuire(:product).permit(:image).merge(user_id: current_user.id)
  end
end
