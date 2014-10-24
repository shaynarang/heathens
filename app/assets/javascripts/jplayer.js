$(document).on("ready page:load", function() {

  var media = [
    "https://s3-us-west-2.amazonaws.com/heathens-assets/uploads/Sample_Track_1_by_Emancipator.mp3",
    "https://s3-us-west-2.amazonaws.com/heathens-assets/uploads/Sample_Track_2_by_Emancipator.mp3"
  ]

  var currentSong = media[0];

  // Instantiate jPlayer
  $("#my-jplayer").jPlayer({
    ready: setMedia,
    ended: playNextSong,
    swfPath: "/",
    supplied: "mp3",
    cssSelectorAncestor: "#audio_player",
    cssSelector: {
      play: "#play-container",
      pause: "#pause-container"
    },
    preload: "auto",
    keyEnabled: true
  });

  $("#prev").click(playPrevSong);
  $("#next").click(playNextSong);

  function playPrevSong() {
    currentSong = media[prevSongIndex()];
    setMedia({ play: true });
  }

  function playNextSong() {
    currentSong = media[nextSongIndex()];
    setMedia({ play: true });
  }

  function setMedia(options) {
    $("span#song-title").text(songTitle());
    $("#my-jplayer").jPlayer("setMedia", {
      mp3: currentSong
    });
    if (options.play) {
      $("#my-jplayer").jPlayer("play");
    }
  }

  function prevSongIndex() {
    return songIndex() == 0 ? media.length - 1 : songIndex() - 1;
  }

  function nextSongIndex() {
    return songIndex() == media.length - 1 ? 0 : songIndex() + 1;
  }

  function songIndex() {
    return media.indexOf(currentSong);
  }

  function songTitle() {
    var songTitle = currentSong.split("/");
    songTitle = songTitle[songTitle.length - 1];
    return songTitle.match(/\w*/)[0].replace(/_/g, " ");
  }

});