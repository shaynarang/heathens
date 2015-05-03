# DISABLE IMAGE CREATION FOR NOW

# promo_gallery = Gallery.create(name: "Promo Images") unless Gallery.find_by_name("Promo Images")

# Dir.foreach('app/assets/images/promo') do |file_name|
#   next if file_name == '.' or file_name == '..' or file_name == ".DS_Store"
#   promo_image = File.open("app/assets/images/promo/#{file_name}")
#   promo_gallery.images.create(content: promo_image) unless Image.find_by_content(file_name)
# end

Category.destroy_all

Post.destroy_all

categories = [
  {name: "News"},
  {name: "Review"},
  {name: "Other"}
]

posts = [
  {author: "Shay", content: "<p>We're always late to the party. That statement bares relevance to multiple areas of our lives, and literally being late to parties. Blame it on bad time management. Blame it on tentativeness. Blame it on a sundry assortment of inexcusable excuses. Whatever the case, we're here now and we're ready to get down. Is there any beer left? How about juice? Gor likes juice.</p><p>This area of the site is dedicated to words. The posts herein may involve 'stream of consciousness' babble, record reviews, HTHNS news, and really whatever Gor and I respectively deem (in)appropriate. After all, we've got a name to live up to. Keep your eyes peeled.</p>", title: "Late to the Party", category: "News"},
  {author: "Shay", content: "<p>HTHNS has been a work in progress for the past eighteen months. It would look/sound very different if it weren't for <a href='http://www.vitalmastering.com/' target='_blank'>Jack Braglia</a> whose mastering prowess and patience helped improve GRTST HTS tremendously and <a href='http://www.zachkeller.net' target='_blank'>Zach Keller</a> whose artwork and design makes it challenging for the music to live up to. Our utmost appreciation to those gents.</p><p>GRTST HTS is set for release later this month.</p>", title: "Credits", category: "News"}
]

categories.each do |category|
  Category.create(category)
end

posts.each do |post|
  author = post[:author]
  content = post[:content]
  title = post[:title]
  category = post[:category]
  category = Category.where(name: category).first
  category.posts << Post.create(author: author, content: content, title: title)
end
