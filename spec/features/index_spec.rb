require 'rails_helper'

RSpec.describe "index" do
  before(:each) do
    FactoryGirl.create(:image)
    visit "/"
  end
    
  it "displays an image" do
    expect(page).to have_selector("img#landing_image[alt=\"Large test\"]")
  end

  it "displays navigation icons" do
    expect(page).to have_selector("li > a > img#bio_icon")
    expect(page).to have_selector("li > a > img#music_icon")
    expect(page).to have_selector("li > a > img#videos_icon")
    expect(page).to have_selector("li > a > img#words_icon")
    expect(page).to have_selector("li > a > img#pictures_icon")
    expect(page).to have_selector("li > a > img#contact_icon")
  end

  it "displays an audio player" do
    expect(page).to have_selector("div#audio_player")
    expect(page).to have_selector("div#audio_controls > div#next")
    expect(page).to have_selector("div#audio_controls > div#play_circle")
    expect(page).to have_selector("div#audio_controls > div#prev")
    expect(page).to have_selector("#my-jplayer.jp-jplayer")
  end

  it "displays the current song", :js => true do
    expect(page).to have_selector("#now-playing")
    expect(page).to have_content("Now Playing:")
  end

  it "refreshes the landing image when the header is clicked", :js => true do
    find("div#heading > h1").click
    expect(page).to have_selector("img#landing_image[alt=\"Large test\"]")
  end

  it "refreshes the landing image when the landing image is clicked", :js => true do
    find("img#landing_image[alt=\"Large test\"]").click
    expect(page).to have_selector("img#landing_image[alt=\"Large test\"]")
  end
end