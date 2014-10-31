class PagesController < ApplicationController

  def home
    @welcome_message = Post.where(context: "News").last
    @tagline = Post.where(page: "Home", context: "Tagline").last
    @philosophy = Post.where(context: "Philosophy").last
    @staff = User.where(admin: true)
    @inquiry = Inquiry.new
  end

  def news
    @posts = Post.where(context: "News")
  end

  def about
    @post = Post.where(page: 'About').last
    @inquiry = Inquiry.new
    @staff = User.where(admin: true)
  end

  def contact
    @inquiry = Inquiry.new
    @post = Post.where(page: 'Contact').last
    @staff = User.where(admin: true)
  end
end
