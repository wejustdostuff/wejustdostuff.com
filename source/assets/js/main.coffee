#= require jquery/jquery
#= require ajaxchimp/jquery.ajaxchimp
#= require sass-bootstrap/js/transition
#= require sass-bootstrap/js/scrollspy
#= require sass-bootstrap/js/collapse
#= require sass-bootstrap/js/modal

$(document).ready ->
  $("#mailchimpform").ajaxChimp
    url: "http://wejustdostuff.us7.list-manage.com/subscribe/post?u=9d88ce76bb9c9bb3bea3601f0&id=2e63c2f86c"

  $(".gradientcontent .gradient:gt(0)").hide()

  setInterval (->
    $(".gradientcontent :first-child").fadeOut(18000).next(".gradient").fadeIn(18000).end().appendTo ".gradientcontent"
  ), 20000

  $('body').scrollspy({ target: '#navbar-header', offset: 60 })
  $("#navbar-header nav a[href^='#']").on('click', (e) ->
    e.preventDefault()
    hash = this.hash
    $('html, body').animate({scrollTop: $(@hash).offset().top - 55}, 300)
  )