class ImagesController < ApplicationController
  private
    def image_params
      params.require(:image).permit(:content)
    end 
end
