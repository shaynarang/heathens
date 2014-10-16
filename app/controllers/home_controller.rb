class HomeController < ApplicationController
  def index
  end

  def display_content
    @galleries = Gallery.all
    @posts = Post.all
    @section = params[:section]
    respond_to do |format|
      format.js
    end
  end
end
