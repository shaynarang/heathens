module ApplicationHelper
  def updated_youtube_url(url)
    # update youtube url such that video embeds in iframe without any warnings/errors
    url
      .gsub('/m.youtube.com', '/youtube.com')
      .gsub('youtu.be', 'www.youtube.com/embed')
      .gsub('/v/', '/embed/')
      .gsub('watch?v=', 'embed/')
      .gsub('autoplay=1', '')
      .concat('?autoplay=0&showinfo=0&controls=0')
      .concat('&enablejsapi=1')
  end
end
