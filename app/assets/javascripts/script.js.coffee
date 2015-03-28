$ ->
  highlight = (element) ->
    $("nav li").removeClass "highlight"
    $(element).addClass "highlight"
    
  $("nav li a").click ->
    highlight $(this).parent()
