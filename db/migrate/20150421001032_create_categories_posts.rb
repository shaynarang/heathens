class CreateCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :categories_posts do |t|
      t.belongs_to :category, index: true
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
