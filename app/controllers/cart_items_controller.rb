class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: :create

  # GET /cart_items
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  def create
    @cart_item = CartItem.new(cart_item_params)

    if @cart_item.save
      redirect_to cart_user_path(current_user.id), notice: 'Cart item was successfully added.'
    else
      render :new
    end
  end

  # PATCH/PUT /cart_items/1
  def update
    if @cart_item.update(cart_item_params)
      redirect_to @cart_item, notice: 'Cart item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cart_items/1
  def destroy
    @cart_item.destroy
    redirect_to cart_user_path(current_user.id), notice: 'Cart item was successfully removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_item_params
      params.require(:cart_item).permit(:user_id, :product_id)
    end
end
