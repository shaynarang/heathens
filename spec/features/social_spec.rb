require 'rails_helper'

RSpec.describe "social" do
  before(:each) do
    visit "/"
    find("li > a#social_link").click
  end
    
  it "contains images linking to social media", :js => true do
    expect(page).to have_selector("img[alt=\"Facebook\"]")
    expect(page).to have_selector("a[href=\"https://www.facebook.com/hthns\"]")
    expect(page).to have_selector("img[alt=\"Twitter\"]")
    expect(page).to have_selector("a[href=\"https://twitter.com/hthnsmusic\"]")
    expect(page).to have_selector("img[alt=\"Instagram\"]")
    expect(page).to have_selector("a[href=\"https://instagram.com/hthns\"]")
    expect(page).to have_selector("img[alt=\"Youtube\"]")
    expect(page).to have_selector("a[href=\"https://youtube.com\"]")
  end
end