$ ->
  highlight = (element) ->
    $("nav li").removeClass "highlight"
    $(element).addClass "highlight"
    
  $("nav li img").click ->
    highlight $(this).parent().parent()
