class SocialPostFetcher
  def select_endpoint network
    case network
    when 'facebook'
      "https://graph.facebook.com/v2.3/#{ENV['FACEBOOK_PAGE_ID']}/posts?access_token=#{ENV['FACEBOOK_APP_ID']}%7C#{ENV['FACEBOOK_SECRET']}"
    end
  end

  def query_endpoint endpoint
    # makes GET request
    JSON.load(open(endpoint))
  end

  def parse_posts network, posts
    case network
    when 'facebook'
      parse_facebook_posts(posts)
    end
  end

  def parse_facebook_posts posts
    collection = {}
    posts['data'].each do |post_data|
      message = post_data['message'].gsub("\n", " ") if post_data['message'] && !post_data['message'].empty?
      time = post_data['created_time'] if post_data['created_time']
      collection[time] = "#{message}"
    end
    collection
  end

  def posts network
    endpoint = select_endpoint(network)
    posts = query_endpoint(endpoint)
    parse_posts(network, posts)
  end

  def fetch_posts
    posts('facebook')
  end
end
