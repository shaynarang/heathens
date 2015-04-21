promo_gallery = Gallery.create(name: "Promo Images") unless Gallery.find_by_name("Promo Images")

Dir.foreach('app/assets/images/promo') do |file_name|
  next if file_name == '.' or file_name == '..' or file_name == ".DS_Store"
  promo_image = File.open("app/assets/images/promo/#{file_name}")
  promo_gallery.images.create(content: promo_image) unless Image.find_by_content(file_name)
end

Category.destroy_all

Post.destroy_all

categories = [
  {name: "News"},
  {name: "Review"},
  {name: "Other"}
]

news_posts = [
  {author: "Shay", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec risus mattis, suscipit magna eget, suscipit augue. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam aliquam commodo lacus in varius. In ac magna nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec ullamcorper ipsum nec tellus maximus cursus. Etiam et metus facilisis, suscipit tellus quis, rhoncus dolor. Etiam consectetur sed purus lobortis pellentesque. Curabitur a sollicitudin libero, ut efficitur dui.", title: "Dolor sit" },
  {author: "Gor", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec risus mattis, suscipit magna eget, suscipit augue. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam aliquam commodo lacus in varius. In ac magna nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec ullamcorper ipsum nec tellus maximus cursus. Etiam et metus facilisis, suscipit tellus quis, rhoncus dolor. Etiam consectetur sed purus lobortis pellentesque. Curabitur a sollicitudin libero, ut efficitur dui.", title: "Lorem ipsum" }
]

review_posts = [
  {author: "Shay", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec risus mattis, suscipit magna eget, suscipit augue. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam aliquam commodo lacus in varius. In ac magna nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec ullamcorper ipsum nec tellus maximus cursus. Etiam et metus facilisis, suscipit tellus quis, rhoncus dolor. Etiam consectetur sed purus lobortis pellentesque. Curabitur a sollicitudin libero, ut efficitur dui.", title: "Consectetur adipiscing elit"},
  {author: "Gor", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec risus mattis, suscipit magna eget, suscipit augue. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam aliquam commodo lacus in varius. In ac magna nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec ullamcorper ipsum nec tellus maximus cursus. Etiam et metus facilisis, suscipit tellus quis, rhoncus dolor. Etiam consectetur sed purus lobortis pellentesque. Curabitur a sollicitudin libero, ut efficitur dui.", title: "Praesent nec"}
]

other_posts = [
  {author: "Shay", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec risus mattis, suscipit magna eget, suscipit augue. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam aliquam commodo lacus in varius. In ac magna nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec ullamcorper ipsum nec tellus maximus cursus. Etiam et metus facilisis, suscipit tellus quis, rhoncus dolor. Etiam consectetur sed purus lobortis pellentesque. Curabitur a sollicitudin libero, ut efficitur dui.", title: "Risus mattis" },
  {author: "Gor", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec risus mattis, suscipit magna eget, suscipit augue. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam aliquam commodo lacus in varius. In ac magna nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec ullamcorper ipsum nec tellus maximus cursus. Etiam et metus facilisis, suscipit tellus quis, rhoncus dolor. Etiam consectetur sed purus lobortis pellentesque. Curabitur a sollicitudin libero, ut efficitur dui.", title: "Suscipit magna eget"},
  {author: "Shay", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec risus mattis, suscipit magna eget, suscipit augue. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam aliquam commodo lacus in varius. In ac magna nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec ullamcorper ipsum nec tellus maximus cursus. Etiam et metus facilisis, suscipit tellus quis, rhoncus dolor. Etiam consectetur sed purus lobortis pellentesque. Curabitur a sollicitudin libero, ut efficitur dui.", title: "Suscipit augue" }
]

categories.each do |category|
  Category.create(category)
end

news_posts.each do |post|
  category = Category.where(name: "News").first
  category.posts << Post.create(post)
end

review_posts.each do |post|
  category = Category.where(name: "Review").first
  category.posts << Post.create(post)
end

other_posts.each do |post|
  category = Category.where(name: "Other").first
  category.posts << Post.create(post)
end
