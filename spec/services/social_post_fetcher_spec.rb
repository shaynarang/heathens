require 'rails_helper'

RSpec.describe "social post fetcher" do

  let(:endpoint) { "https://graph.facebook.com/v2.3/#{ENV['FACEBOOK_PAGE_ID']}/posts?access_token=#{ENV['FACEBOOK_APP_ID']}%7C#{ENV['FACEBOOK_SECRET']}" }

  let(:query_endpoint) {
    VCR.use_cassette('social_posts') do
      JSON.load(open(endpoint))
    end
  }

  subject { query_endpoint }
    it { should be_a(Hash) }
    it { should_not be_empty }

  it "contains values for target keys" do
    query_endpoint['data'].each do |post_data|
      expect(post_data).to have_key('created_time')
      expect(post_data['created_time']).to be_a(String)
      expect(post_data['created_time']).to_not be_nil
      expect(post_data['created_time'].size).to be > 1
      if post_data.has_key?('message')
        expect(post_data['message']).to be_a(String)
        expect(post_data['message']).to_not be_nil
        expect(post_data['message'].size).to be > 1
      end
    end
  end

  let(:posts) {
    social_post_fetcher = SocialPostFetcher.new
    posts = query_endpoint
    social_post_fetcher.parse_posts('facebook', posts)
  }

  subject { posts }
    it { should be_a(Hash) }
    it { should_not be_empty }

  it "contains date keys and message values" do
    posts.each do |date, message|
      parsed_date = DateTime.parse(date)
      expect(parsed_date).to be_a(DateTime)
      expect(message).to be_a(String)
    end
  end
end