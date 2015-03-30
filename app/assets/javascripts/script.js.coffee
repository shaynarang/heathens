$ ->
  highlight = (element) ->
    $("nav li a").removeClass "highlight"
    $(element).addClass "highlight"
    
  $("nav li a").click ->
    highlight $(this)
