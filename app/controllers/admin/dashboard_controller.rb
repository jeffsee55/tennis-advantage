class Admin::DashboardController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
    @inquiries = Inquiry.all
    @programs = Program.all
    @locations = Location.all
  end
end
