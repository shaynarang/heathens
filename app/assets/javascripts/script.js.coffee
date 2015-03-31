$ ->
  highlight = (element) ->
    $("#standard_nav nav ul li a").removeClass "highlight"
    $("#mobile_nav nav #expanded ul li a").removeClass "highlight"
    $(element).addClass "highlight"
    
  $("#standard_nav nav ul li a").click ->
    highlight this

  $("#mobile_nav nav #expanded ul li a").click ->
    highlight this
