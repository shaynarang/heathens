class AddCategoriesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :categories, :string, :array => true, :default => []
  end
end
