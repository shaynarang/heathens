class HomeController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').all
    @categories = Category.all
  end

  def display_content
    @message = Message.new
    @galleries = Gallery.all
    @posts = Post.order('created_at DESC').all
    @categories = Category.all
    @section = params[:section]
    respond_to do |format|
      format.js
    end
  end

  def social
    social_post_fetcher = SocialPostFetcher.new
    @social_posts = social_post_fetcher.fetch_posts.sort.reverse.to_h
    respond_to do |format|
      format.js
    end
  end
end
