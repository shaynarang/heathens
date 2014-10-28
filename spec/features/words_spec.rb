require 'rails_helper'

RSpec.describe "words" do
  before(:each) do
    FactoryGirl.create(:image)
    @post = FactoryGirl.create(:post, author: "Shay", title: "My Post", content: "This is the content for my post.")
    visit "/"
    find("li > a > img#words_icon").click
  end
    
  it "populates the content section with the post author, title, and timestamp", :js => true do
    timestamp = @post.created_at.strftime("%d %b %y")
    expect(page).to have_content("WORDS")
    expect(page).to have_content("Shay")
    expect(page).to have_content("My Post")
    expect(page).to have_content(timestamp)
    expect(page).to_not have_content("This is the content for my post.")
  end

  it "shows post content when a post is clicked", :js => true do
    find(".post").click
    expect(page).to have_content("This is the content for my post.")
  end
end