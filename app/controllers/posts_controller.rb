class PostsController < ApplicationController
  def filter
    category = params[:category]
    if category == "all"
      @posts = Post.order('created_at DESC').all
    else
      @posts = Category.find(category).posts
    end

    respond_to do |format|
      format.js { render 'home/filter_posts' }
    end
  end
end