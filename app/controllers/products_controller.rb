class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: :add_to_cart

  # GET /products
  def index
    @products = Product.all
    @post = Post.where(page: "Shop").last || Post.where(page: "Home", context: "Tagline").last
  end

  # GET /products/1
  def show
    @cart_item = CartItem.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params[:product].permit(:name, :description, :price)
    end
end
