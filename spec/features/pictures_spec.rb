require 'rails_helper'

RSpec.describe "pictures" do
  before(:each) do
    first_image = FactoryGirl.create(:image)
    second_image = FactoryGirl.create(:image, content: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'photos', 'test2.jpg')))
    gallery = FactoryGirl.create(:gallery)
    gallery.images << first_image
    gallery.images << second_image
    visit "/"
    find("li > a#pictures_link").click
  end
    
  it "populates the content section with image content", :js => true do
    expect(page).to have_content("PICTURES")
    expect(page).to have_selector("img[alt=\"Medium test\"]")
    expect(page).to have_selector("img[alt=\"Medium test2\"]")
  end

  it "displays images via fancybox when clicked", :js => true do
    expect(page).to have_selector(".fancybox > img[src*='medium_test']")
    expect(page).to_not have_selector("#fancybox-img[src*='large_test']")
    find("img[alt=\"Medium test\"]").click
    expect(page).to have_selector("#fancybox-img[src*='large_test']")
  end
end