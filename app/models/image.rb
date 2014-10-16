class Image < ActiveRecord::Base
  mount_uploader :content, ImageUploader
  belongs_to :imageable, :polymorphic => true
end
