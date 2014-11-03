class PostsController < ApplicationController
  def filter
    params[:categories] == "all" ? @posts = Post.order('created_at DESC').all : @posts = Post.by_category(params[:categories])
    respond_to do |format|
      format.js { render 'home/filter_posts' }
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:categories)
    end
end