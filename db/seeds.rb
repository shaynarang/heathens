Image.destroy_all
Gallery.destroy_all

promo_gallery = Gallery.create(name: "Promo Images")
Dir.foreach('app/assets/images/promo') do |file_name|
  next if file_name == '.' or file_name == '..' or file_name == ".DS_Store"
  promo_image = File.open("app/assets/images/promo/#{file_name}")
  promo_gallery.images.create(content: promo_image)
end
