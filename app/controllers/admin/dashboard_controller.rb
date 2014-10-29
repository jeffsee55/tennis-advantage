class Admin::DashboardController < ApplicationController
  authorize_resource class: false
  skip_before_filter :set_inquiry
  layout "admin_layout"

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @posts = Post.all
    @inquiries = Inquiry.all
    @programs = Program.all
    @program_categories = ProgramCategory.all
    @locations = Location.all
    @products = Product.all
    @charges = Charge.all
  end
end
