FactoryGirl.define do
  factory :image do |f|
    f.content { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'photos', 'test.jpg')) }
  end
end