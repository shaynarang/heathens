require 'rails_helper'

RSpec.describe "videos" do
  before(:each) do
    FactoryGirl.create(:image)
    visit "/"
    find("li > a#videos_link").click
  end
    
  it "populates the content section with videos content", :js => true do
    expect(page).to have_selector('.video')
  end
end