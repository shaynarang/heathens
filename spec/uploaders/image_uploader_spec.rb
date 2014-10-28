require 'rails_helper'
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    ImageUploader.enable_processing = true
    post = FactoryGirl.create(:post)
    @uploader = ImageUploader.new(post, :image)
    @uploader.store!(File.open("#{Rails.root}/spec/photos/test.jpg"))
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'thumb' do
    it "should resize to a limit of 200 by 200 pixels" do
      expect(@uploader.thumb).to be_no_larger_than(200, 200)
    end
  end

  context 'medium' do
    it "should resize to fill 500 by 500 pixels" do
      expect(@uploader.medium).to have_dimensions(500, 500)
    end
  end

  context 'large' do
    it "should resize to a limit of 700 by 700 pixels" do
      expect(@uploader.large).to be_no_larger_than(700, 700)
    end
  end
end