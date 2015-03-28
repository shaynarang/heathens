require 'rails_helper'

RSpec.describe "music" do
  before(:each) do
    FactoryGirl.create(:image)
    visit "/"
    find("li > a#music_link").click
  end
    
  it "populates the content section with music content", :js => true do
    content = "Vivamus elit nisl, placerat eget placerat non, porta sed justo. Maecenas at convallis erat, at vulputate quam. Nullam sagittis est quis facilisis bibendum. Morbi ut massa eu sem vestibulum fringilla nec sed velit. Sed a enim iaculis, volutpat urna id, iaculis justo. Nulla non nisl auctor, ultricies eros eget, semper mi. Duis sit amet justo tortor."
    expect(page).to have_content(content.upcase)
  end
end