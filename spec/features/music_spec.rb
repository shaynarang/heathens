require 'rails_helper'

RSpec.describe "music" do
  before(:each) do
    FactoryGirl.create(:image)
    visit "/"
    find("#standard_nav > nav > ul > li > a#music_link").click
  end
    
  it "redirects to the bandcamp page" do
    expect(current_url).to eq("http://www.hthns.bandcamp.com/")
  end
end