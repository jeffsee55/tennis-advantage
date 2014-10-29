class ChargesController < ApplicationController
  def show
    @charge = Charge.find(params[:id])
    @cart_items = CartItem.where(charge_id: @charge.id)
  end

  def new
    @user = User.find(params[:id])
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(charge_params)
    @user = User.find(params[:id])
    @cart_items = @user.new_items
    if @charge.charge_card
      @charge.save_shipping_address
      @charge.save
      @cart_items.update_all(purchased: true, charge_id: @charge.id)
      redirect_to @charge
    else
      render :new
    end
  end

  private
    def charge_params
      params.require(:charge).permit(:stripe_card_token, :amount, :user_id, :address_line_1, :address_line_2, :city, :state, :zip, :country)
    end
end
