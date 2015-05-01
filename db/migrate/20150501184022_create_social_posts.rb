class CreateSocialPosts < ActiveRecord::Migration
  def change
    create_table :social_posts do |t|
      t.datetime :posted_at
      t.text :text
      t.string :url
      t.string :network

      t.timestamps
    end
  end
end
