require 'rails_helper'

RSpec.describe "social post fetcher" do

  let(:raw_facebook_posts) {
    VCR.use_cassette('facebook_posts') do
      SocialPostFetcher.query_api('facebook')
    end
  }

  subject { raw_facebook_posts }
    it { should be_a(Hash) }
    it { should_not be_empty }

  it "contains values for target keys" do
    raw_facebook_posts['data'].each do |post_data|
      expect(post_data).to have_key('created_time')
      expect(post_data['created_time']).to_not be_nil
      expect(post_data['created_time']).to be_a(String)
      expect(post_data['created_time'].size).to be > 1

      expect(post_data).to have_key('id')
      expect(post_data['id']).to_not be_nil
      expect(post_data['id']).to be_a(String)
      expect(post_data['id'].size).to be > 1

      if post_data['message']
        expect(post_data['message']).to be_a(String)
        expect(post_data['message'].size).to be > 1
      end
    end
  end

  it "parses facebook posts" do
    raw_facebook_posts['data'].each do |post|
      if post['message'] && !post['message'].empty?
        parsed_post = SocialPostFetcher.parse_facebook_post(post)
        expect(parsed_post).to be_a(Hash)
        expect(parsed_post[:posted_at]).to be_a(DateTime)
        expect(parsed_post[:network]).to be_a(String)
        expect(parsed_post[:text]).to be_a(String)
        expect(parsed_post[:url]).to be_a(String)
      end
    end
  end

  let(:raw_twitter_posts) {
    VCR.use_cassette('twitter_posts') do
      SocialPostFetcher.query_api('twitter')
    end
  }

  subject { raw_twitter_posts }
    it { should be_a(Hash) }
    it { should_not be_empty }

  it "contains values for target keys" do
    raw_twitter_posts.each do |post_data|
      expect(post_data.created_at).to_not be_nil
      expect(post_data.created_at).to be_a(Time)

      expect(post_data.uri).to_not be_nil
      expect(post_data.uri).to be_a(Addressable::URI)

      if post_data.text
        expect(post_data.text).to be_a(String)
        expect(post_data.text.size).to be > 1
      end
    end
  end

  it "parses twitter posts" do
    raw_twitter_posts.each do |post|
      unless post.text.nil?
        parsed_post = SocialPostFetcher.parse_twitter_post(post)
        expect(parsed_post).to be_a(Hash)
        expect(parsed_post[:posted_at]).to be_a(Time)
        expect(parsed_post[:network]).to be_a(String)
        expect(parsed_post[:text]).to be_a(String)
        expect(parsed_post[:url]).to be_a(String)
      end
    end
  end

  let(:raw_instagram_posts) {
    VCR.use_cassette('instagram_posts') do
      SocialPostFetcher.query_api('instagram')
    end
  }

  subject { raw_instagram_posts }
    it { should be_a(Hash) }
    it { should_not be_empty }

  it "contains values for target keys" do
    raw_instagram_posts['data'].each do |post|
      expect(post['created_time']).to_not be_nil
      expect(post['created_time']).to be_a(String)

      expect(post['link']).to_not be_nil
      expect(post['link']).to be_a(String)

      if post['caption']
        expect(post['caption']['text']).to be_a(String)
        expect(post['caption']['text'].size).to be > 1
      end
    end
  end

  it "contains date keys and post data values" do
    raw_instagram_posts['data'].each do |post|
      caption = post['caption']
      if caption['text'] && !caption['text'].empty?
        parsed_post = SocialPostFetcher.parse_instagram_post(post)
        expect(parsed_post).to be_a(Hash)
        expect(parsed_post[:posted_at]).to be_a(Time)
        expect(parsed_post[:network]).to be_a(String)
        expect(parsed_post[:text]).to be_a(String)
        expect(parsed_post[:url]).to be_a(String)
      end
    end
  end
end