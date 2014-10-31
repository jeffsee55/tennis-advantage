class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :view_cart]

  def index
    @users = User.all
    @post = Post.where(title: 'Staff').last
  end

  def show
  end

  def update
    @user.update!(user_params)
    redirect_to :back, notice: "#{@user.full_name}'s has been successfully edited"
  end

  def view_cart
    @cart_items = @user.cart_items.where(purchased: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :description, :admin)
    end
end
