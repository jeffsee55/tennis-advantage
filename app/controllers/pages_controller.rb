class PagesController < ApplicationController

  def home
    @inquiry = Inquiry.new
    @post = Post.where(tags: "News").last
    @staff = User.where(admin: true)
  end

  def about
    @post = Post.where(tags: 'About').last
  end

  def contact
    @inquiry = Inquiry.new
    @post = Post.where(tags: 'Contact').last
    @staff = User.where(first_name: "Scott")
  end

end
