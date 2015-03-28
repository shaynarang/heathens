require 'rails_helper'

RSpec.describe "words" do
  before(:each) do
    FactoryGirl.create(:image)
    @news_post = FactoryGirl.create(:post, author: "Shay", title: "HTHNS News", content: "This is some news.", categories: ["news"])
    @review_post = FactoryGirl.create(:post, author: "Gor!", title: "HTHNS Review", content: "This is a review.", categories: ["review"])
    visit "/"
    find("li > a#words_link").click
  end
    
  it "populates the content section with the post author, title, and timestamp", :js => true do
    timestamp = @news_post.created_at.strftime("%d %b %y")
    expect(page).to have_content("WORDS")
    expect(page).to have_content("SHAY")
    expect(page).to have_content("NEWS")
    expect(page).to have_content(timestamp.upcase)
    expect(page).to_not have_content("THIS IS SOME NEWS.")
  end

  it "shows post content when a post is clicked", :js => true do
    expect(page).to_not have_content("THIS IS SOME NEWS.")
    expect(page).to_not have_content("THIS IS A REVIEW.")
    find("#hthnsnews").click
    expect(page).to have_content("THIS IS SOME NEWS.")
    expect(page).to_not have_content("THIS IS A REVIEW.")
    find("#hthnsreview").click
    expect(page).to have_content("THIS IS A REVIEW.")
  end

  it "displays post categories", :js => true do
    expect(page).to have_content("CATEGORY:")
    expect(page).to have_content("NEWS")
    expect(page).to have_content("REVIEW")
    expect(page).to have_content("ALL")
  end

  it "allows visitors to view posts by category", :js => true do
    find("a#news_link").click
    expect(page).to have_content("SHAY")
    expect(page).to have_content("HTHNS NEWS")
    expect(page).to_not have_content("GOR!")
    expect(page).to_not have_content("HTHNS REVIEW")
    find("a#review_link").click
    expect(page).to have_content("GOR!")
    expect(page).to have_content("HTHNS REVIEW")
    expect(page).to_not have_content("SHAY")
    expect(page).to_not have_content("HTHNS NEWS")
    find("a#all_link").click
    expect(page).to have_content("GOR!")
    expect(page).to have_content("HTHNS REVIEW")
    expect(page).to have_content("SHAY")
    expect(page).to have_content("HTHNS NEWS")
  end
end