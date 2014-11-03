class Post < ActiveRecord::Base
  has_many :images, :as => :imageable

  scope :by_category, ->(category) { where(:categories => "{#{category}}") }
end