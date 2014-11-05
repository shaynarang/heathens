$ ->
  media = [
    "https://s3-us-west-2.amazonaws.com/heathens-assets/uploads/Sample_Track_1_by_Emancipator.mp3",
    "https://s3-us-west-2.amazonaws.com/heathens-assets/uploads/Sample_Track_2_by_Emancipator.mp3"
  ]

  currentSong = media[0]

  playPrevSong = ->
    currentSong = media[prevSongIndex()]
    setMedia play: true

  playNextSong = ->
    currentSong = media[nextSongIndex()]
    setMedia play: true

  prevSongIndex = ->
    if songIndex() is 0 then media.length - 1 else songIndex() - 1

  nextSongIndex = ->
    if songIndex() is media.length - 1 then 0 else songIndex() + 1

  songIndex = ->
    media.indexOf currentSong

  songTitle = ->
    title = currentSong.split("/")
    title = title[title.length - 1]
    title.match(/\w*/)[0].replace /_/g, " "

  setMedia = (options) ->
    $("span#song-title").text songTitle()
    $("#my-jplayer").jPlayer "setMedia", mp3: currentSong
    $("#my-jplayer").jPlayer "play" if options.play

  # Instantiate jPlayer
  $("#my-jplayer").jPlayer
    ready: setMedia
    ended: playNextSong
    swfPath: "/"
    supplied: "mp3"
    cssSelectorAncestor: "#audio_player"
    cssSelector:
      play: "#play-container"
      pause: "#pause-container"
    preload: "auto"
    keyEnabled: true

  $("#prev").click(playPrevSong)
  $("#next").click(playNextSong)
