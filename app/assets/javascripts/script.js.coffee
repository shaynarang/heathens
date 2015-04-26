$ ->
  highlight = (element) ->
    if element.id != 'music_link'
      $("#standard_nav nav ul li a").removeClass "highlight"
      $("#mobile_nav nav #expanded ul li a").removeClass "highlight"
      $(element).addClass "highlight"

  highlight $("a#words_link")
    
  $("#standard_nav nav ul li a").click ->
    highlight this

  $("#mobile_nav nav #expanded ul li a").click ->
    highlight this

  $("#heading_row").click ->
    highlight $("a#words_link")
