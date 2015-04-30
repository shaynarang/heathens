$ ->
  $('#ajax_loader').hide()

  $("ul li a#social_link").click ->
    $('#content').hide()
    $('#ajax_loader').show()

    $(document).ajaxStop (r, s) ->
      $('#ajax_loader').hide()
      return

  highlight = (element) ->
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
