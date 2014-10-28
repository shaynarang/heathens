require 'rails_helper'

RSpec.describe "contact" do
  before(:each) do
    FactoryGirl.create(:image)
    visit "/"
    find("li > a > img#contact_icon").click
  end
    
  it "populates the content section with contact ", :js => true do
    expect(page).to have_content("CONTACT")
    expect(page).to have_selector("input#message_name")
    expect(page).to have_selector("input#message_email")
    expect(page).to have_selector("input#message_subject")
    expect(page).to have_selector("textarea#message_content")
  end
end