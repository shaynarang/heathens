require 'rails_helper'

RSpec.describe "words" do
  before(:each) do
    FactoryGirl.create(:image)
    @news_post = FactoryGirl.create(:post, author: "Shay", title: "News", content: "This is some news.", categories: ["news"])
    @review_post = FactoryGirl.create(:post, author: "Gor", title: "Review", content: "This is a review.", categories: ["review"])
    visit "/"
    find("li > a > img#words_icon").click
  end
    
  it "populates the content section with the post author, title, and timestamp", :js => true do
    timestamp = @news_post.created_at.strftime("%d %b %y")
    expect(page).to have_content("WORDS")
    expect(page).to have_content("Shay")
    expect(page).to have_content("News")
    expect(page).to have_content(timestamp)
    expect(page).to_not have_content("This is some news.")
  end

  it "shows post content when a post is clicked", :js => true do
    expect(page).to_not have_content("This is some news.")
    expect(page).to_not have_content("This is a review.")
    find("#news").click
    expect(page).to have_content("This is some news.")
    expect(page).to_not have_content("This is a review.")
    find("#review").click
    expect(page).to have_content("This is a review.")
  end

  it "displays post categories", :js => true do
    expect(page).to have_content("Filter by Category:")
    expect(page).to have_content("NEWS")
    expect(page).to have_content("REVIEW")
    expect(page).to have_content("ALL")
  end

  it "allows visitors to view posts by category", :js => true do
    find("a#news_link").click
    expect(page).to have_content("Shay")
    expect(page).to have_content("News")
    expect(page).to_not have_content("Gor")
    expect(page).to_not have_content("Review")
    find("a#review_link").click
    expect(page).to have_content("Gor")
    expect(page).to have_content("Review")
    expect(page).to_not have_content("Shay")
    expect(page).to_not have_content("News")
    find("a#all_link").click
    expect(page).to have_content("Gor")
    expect(page).to have_content("Review")
    expect(page).to have_content("Shay")
    expect(page).to have_content("News")
  end
end