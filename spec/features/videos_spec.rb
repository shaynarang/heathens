require 'rails_helper'

RSpec.describe "videos" do
  before(:each) do
    FactoryGirl.create(:image)
    visit "/"
    find("li > a > img#videos_icon").click
  end
    
  it "populates the content section with videos content", :js => true do
    expect(page).to have_content("VIDEOS")
    expect(page).to have_content("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quis dignissim nunc. Phasellus tempor mi ac augue cursus, et mollis purus facilisis. Nunc lobortis sagittis hendrerit. Nam id luctus tellus. Nulla pharetra nec risus ut condimentum. Ut interdum leo eu orci sagittis lacinia. Nulla vitae nisl id dui laoreet convallis.")
  end
end