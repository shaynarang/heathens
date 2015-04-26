class SocialPostFetcher

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
    end
  end

  def parse_posts network, posts
    case network
    when 'facebook'
      parse_facebook_posts(posts)
    when 'twitter'
      parse_twitter_posts(posts)
    end
  end

  def parse_facebook_posts posts
    collection = {}
    posts['data'].each do |post_data|
      next unless post_data['message'] && !post_data['message'].empty?
      message = post_data['message'].gsub("\n", " ")
      time = post_data['created_time']
      time = DateTime.parse(time)
      collection[time] = message
    end
    collection
  end

  def parse_twitter_posts posts
    collection = {}
    posts.each do |post|
      next if post.text.nil?
      collection[post.created_at] = post.text
    end
    collection
  end

  def posts network
    posts = query_api(network)
    parse_posts(network, posts)
  end

  def fetch_posts
    posts('facebook').merge(posts('twitter'))
  end

end
