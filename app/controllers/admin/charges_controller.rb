class Admin::ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :update]
  skip_before_filter :set_inquiry
  layout "admin_layout"


  def show
    @cart_items = CartItem.where(charge_id: @charge.id)
  end

  def index
    @charges = Charge.all
  end

  def update
    if @charge.update(charge_params)
      redirect_to :back, notice: "Charge's shipping status was successfully changed."
    else
      redirect_to :back, notice: "Charge's shipping status was successfully changed."
    end
  end

  private
    def set_charge
      @charge = Charge.find(params[:id])
    end

    def charge_params
      params.require(:charge).permit(:shipped)
    end
end
