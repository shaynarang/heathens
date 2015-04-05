require 'rails_helper'

RSpec.describe "index" do
  before(:each) do
    FactoryGirl.create(:image)
    visit "/"
  end

  it "displays navigation links" do
    expect(page).to have_selector("li > a#bio_link")
    expect(page).to have_selector("li > a#music_link")
    expect(page).to have_selector("li > a#videos_link")
    expect(page).to have_selector("li > a#words_link")
    expect(page).to have_selector("li > a#pictures_link")
    expect(page).to have_selector("li > a#contact_link")
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
    expect(page).to have_content("NOW PLAYING:")
  end
end