require 'rails_helper'

RSpec.describe "music" do
  before(:each) do
    FactoryGirl.create(:image)
    visit "/"
    find("#standard_nav > nav > ul > li > a#music_link").click
  end
    
  it "populates the content section with music content", :js => true do
    content = "GRTST HTS will soon be available at a number of digital outlets. Hang out with HTHNS on social media to stay posted:"
    expect(page).to have_content(content.upcase)
    expect(page).to have_selector("a.facebook_link")
    expect(page).to have_selector("a.twitter_link")
    expect(page).to have_selector("a.instagram_link")
  end
end