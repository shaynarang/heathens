desc "Import New Social Posts"
task fetch_social_posts: :environment do
  puts "Fetching posts..."
  SocialPostFetcher.fetch_posts
  puts "Completed."
end