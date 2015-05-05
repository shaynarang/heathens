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
        endpoint = "https://graph.facebook.com/v2.3/790511054367668/posts?access_token=#{ENV['FACEBOOK_APP_ID']}%7C#{ENV['FACEBOOK_SECRET']}"
        JSON.load(open(endpoint))
      when 'twitter'
        twitter_client.user_timeline('hthnsmusic')
      when 'instagram'
        endpoint = "https://api.instagram.com/v1/users/1794978093/media/recent/?client_id=#{ENV['INSTAGRAM_CLIENT_ID']}"
        JSON.load(open(endpoint))
      end
    end

    def save_post post_data
      url = post_data[:url]
      posted_at = post_data[:posted_at]
      text = post_data[:text]
      network = post_data[:network]
      unless SocialPost.find_by_url(post_data[:url])
        SocialPost.create(posted_at: posted_at, text: text, url: url, network: network)
      end
    end

    def parse_facebook_post post
      return unless post['message'] && !post['message'].empty?
      post_data = {}
      time = post['created_time']
      post_data[:posted_at] = DateTime.parse(time)
      post_data[:text] = post['message'].gsub("\n", " ")
      post_data[:url] = "http://www.facebook.com/#{post['id']}"
      post_data[:network] = "facebook"
      post_data
    end

    def parse_twitter_post post
      return if post.text.nil?
      post_data = {}
      post_data[:posted_at] = post.created_at
      post_data[:text] = post.text
      post_data[:url] = post.uri.to_s
      post_data[:network] = "twitter"
      post_data
    end

    def parse_instagram_post post
      caption = post['caption']
      return unless caption['text'] && !caption['text'].empty?
      post_data = {}
      time = post['created_time']
      post_data[:posted_at] = Time.at(time.to_i)
      post_data[:text] = caption['text']
      post_data[:network] = "instagram"
      post_data[:url] = post['link']
      post_data
    end

    def save_posts posts, network
      posts = posts['data'] unless network == 'twitter'
      posts.each do |post|
        case network
        when 'facebook'
          post_data = parse_facebook_post(post)
        when 'twitter'
          post_data = parse_twitter_post(post)
        when 'instagram'
          post_data = parse_instagram_post(post)
        end
        save_post(post_data) if !post_data.nil?
      end
    end

    def fetch_posts
      networks = ['facebook', 'twitter', 'instagram']
      networks.each do |network|
        posts = query_api(network)
        save_posts(posts, network)
      end
    end
  end

end
