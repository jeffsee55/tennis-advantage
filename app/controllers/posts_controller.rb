class PostsController < ApplicationController

  def index
    @posts = Post.where(context: "News")
  end

  def show
    @post = Post.find(params[:id])
  end

end
