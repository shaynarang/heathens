class HomeController < ApplicationController
  def index
    # @random_image_url = Image.random.content.large.url
  end

  def display_content
    # @random_image_url = Image.random.content.large.url
    @message = Message.new
    @galleries = Gallery.all
    @posts = Post.order('created_at DESC').all
    @categories = @posts.pluck(:categories).uniq.flatten
    @section = params[:section]
    respond_to do |format|
      format.js
    end
  end
end
