require 'rails_helper'

RSpec.describe "social post fetcher" do

  let(:social_post_fetcher) { SocialPostFetcher.new }

  let(:facebook_query) {
    VCR.use_cassette('facebook_posts') do
      social_post_fetcher.query_api('facebook')
    end
  }

  subject { facebook_query }
    it { should be_a(Hash) }
    it { should_not be_empty }

  it "contains values for target keys" do
    facebook_query['data'].each do |post_data|
      expect(post_data).to have_key('created_time')
      expect(post_data['created_time']).to_not be_nil
      expect(post_data['created_time']).to be_a(String)
      expect(post_data['created_time'].size).to be > 1
      if post_data['message']
        expect(post_data['message']).to be_a(String)
        expect(post_data['message'].size).to be > 1
      end
    end
  end

  let(:facebook_posts) {
    posts = facebook_query
    social_post_fetcher.parse_posts('facebook', posts)
  }

  subject { facebook_posts }
    it { should be_a(Hash) }
    it { should_not be_empty }

  it "contains date keys and message values" do
    facebook_posts.each do |date, message|
      expect(date).to be_a(DateTime)
      expect(message).to be_a(String)
    end
  end

  let(:twitter_query) {
    VCR.use_cassette('twitter_posts') do
      social_post_fetcher.query_api('twitter')
    end
  }

  subject { twitter_query }
    it { should be_a(Hash) }
    it { should_not be_empty }

  it "contains values for target keys" do
    twitter_query.each do |post_data|
      expect(post_data.created_at).to_not be_nil
      expect(post_data.created_at).to be_a(Time)
      if post_data.text
        expect(post_data.text).to be_a(String)
        expect(post_data.text.size).to be > 1
      end
    end
  end

  let(:twitter_posts) {
    posts = twitter_query
    social_post_fetcher.parse_posts('twitter', posts)
  }

  subject { twitter_posts }
    it { should be_a(Hash) }
    it { should_not be_empty }

  it "contains date keys and message values" do
    twitter_posts.each do |date, message|
      expect(date).to be_a(Time)
      expect(message).to be_a(String)
    end
  end
end