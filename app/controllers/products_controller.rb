class ProductsController < ApplicationController

  def index
    
  end

  private

  def product_params
    params.repuire(:product).permit(:image).merge(user_id: current_user.id)
  end
end
