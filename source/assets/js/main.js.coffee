#= require jquery/jquery
#= require sass-bootstrap/js/transition
#= require sass-bootstrap/js/scrollspy
#= require sass-bootstrap/js/collapse
#= require sass-bootstrap/js/modal

$(document).ready ->
  $(".gradientcontent .gradient:gt(0)").hide()

  setInterval (->
    $(".gradientcontent :first-child").fadeOut(18000).next(".gradient").fadeIn(18000).end().appendTo ".gradientcontent"
  ), 20000

  $('body').scrollspy({ target: '#header', offset: 60 })

  $("#header nav a[href^='#']").on('click', (e) ->
    e.preventDefault()
    $('html, body').animate({scrollTop: $(@hash).offset().top - 55}, 300)
  )
