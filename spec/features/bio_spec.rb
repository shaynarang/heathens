require 'rails_helper'

RSpec.describe "bio" do
  before(:each) do
    FactoryGirl.create(:image)
    visit "/"
    find("li > a#bio_link").click
  end
    
  it "populates the content section with bio content", :js => true do
    expect(page).to have_content("BIO")
    expect(page).to have_content("IF ONE CAN LIKEN THE COMBINATION OF LUSH SYNTH TONES AND CATCHY POP MELODIES TO A BABY, THE SOUND OF HTHNS CAN BE DESCRIBED AS SAID BABY PUNCHING YOU IN THE FACE. HTHNS IS AN ELECTRONIC ROCK DUO BASED OUT OF NASHVILLE, TN. FORMED IN 2014, THE DUO ASSIMILATES ELEMENTS PREVALENT IN MODERN COMMERCIAL MUSIC WITH DARK, FUZZY, AND QUIRKY TONES, PRESENTING THE IDEAL POP MUSIC EXPERIENCE FOR LISTENERS WHO DON'T LIKE POP MUSIC. THE DEBUT EP, GRTST HTS, IS SET FOR RELEASE IN MAY 2015.")
  end
end