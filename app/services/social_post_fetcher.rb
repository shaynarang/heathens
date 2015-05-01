class SocialPostFetcher

  class << self
    def twitter_client
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
      end
    end

    def query_api network
      case network
      when 'facebook'
        endpoint = "https://graph.facebook.com/v2.3/#{ENV['FACEBOOK_PAGE_ID']}/posts?access_token=#{ENV['FACEBOOK_APP_ID']}%7C#{ENV['FACEBOOK_SECRET']}"
        JSON.load(open(endpoint))
      when 'twitter'
        twitter_client.user_timeline('shaynarang')
      when 'instagram'
        endpoint = "https://api.instagram.com/v1/users/1641346011/media/recent/?client_id=#{ENV['INSTAGRAM_CLIENT_ID']}"
        JSON.load(open(endpoint))
      end
    end

    def parse_posts network, posts
      case network
      when 'facebook'
        parse_facebook_posts(posts)
      when 'twitter'
        parse_twitter_posts(posts)
      when 'instagram'
        parse_instagram_posts(posts)
      end
    end

    def parse_facebook_posts posts
      collection = {}
      posts['data'].each do |post_data|
        next unless post_data['message'] && !post_data['message'].empty?
        time = post_data['created_time']
        time = DateTime.parse(time)
        message = post_data['message'].gsub("\n", " ")
        post_url = "http://www.facebook.com/#{post_data['id']}"
        klass = "facebook_link"
        collection[time] = [message, post_url, klass]
      end
      collection
    end

    def parse_twitter_posts posts
      collection = {}
      posts.each do |post|
        next if post.text.nil?
        klass = "twitter_link"
        collection[post.created_at] = [post.text, post.uri, klass]
      end
      collection
    end

    def parse_instagram_posts posts
      collection = {}
      posts['data'].each do |post|
        caption = post['caption']
        next unless caption['text'] && !caption['text'].empty?
        klass = "instagram_link"
        time = post['created_time']
        time = Time.at(time.to_i)
        collection[time] = [caption['text'], post['link'], klass]
      end
      collection
    end

    def posts network
      posts = query_api(network)
      parse_posts(network, posts)
    end

    def fetch_posts
      facebook_posts = posts('facebook')
      twitter_posts = posts('twitter')
      instagram_posts = posts('instagram')
      facebook_posts.merge(twitter_posts).merge(instagram_posts)
    end
  end

end
