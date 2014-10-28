require 'rails_helper'

RSpec.describe "bio" do
  before(:each) do
    FactoryGirl.create(:image)
    visit "/"
    find("li > a > img#bio_icon").click
  end
    
  it "populates the content section with bio content", :js => true do
    expect(page).to have_content("BIO")
    expect(page).to have_content("Integer blandit magna a nulla mattis elementum. Pellentesque quis dignissim nunc. Phasellus tempor mi ac augue cursus, et mollis purus facilisis. Nunc lobortis sagittis hendrerit. Nam id luctus tellus. Nulla pharetra nec risus ut condimentum. Ut interdum leo eu orci sagittis lacinia. Nulla vitae nisl id dui laoreet convallis.")
  end
end