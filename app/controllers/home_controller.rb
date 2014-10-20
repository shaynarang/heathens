class HomeController < ApplicationController
  def index
  end

  def display_content
    @message = Message.new
    @galleries = Gallery.all
    @posts = Post.order('created_at DESC').all
    @section = params[:section]
    respond_to do |format|
      format.js
    end
  end
end
