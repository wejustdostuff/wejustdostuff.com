#= require jquery/jquery
#= require ajaxchimp/jquery.ajaxchimp
#= require fixedmenu
#= require sass-bootstrap/js/collapse
#= require sass-bootstrap/js/transition
#= require sass-bootstrap/js/modal


$(window).load ->
  $("#mailchimpform").ajaxChimp
    url: "http://wejustdostuff.us7.list-manage.com/subscribe/post?u=9d88ce76bb9c9bb3bea3601f0&id=1e7429d7b8"


$(document).ready ->
  mainMenu = new $.fixedmenu($(".navigation"),
    duration: 500
    easing: "swing"
    topmargin: 70
  )
  mainMenu.foo_public_method()

  #setInterval (->
  #  $(".imgslideshow :first-child").fadeOut(1000).next("img").fadeIn(1000).end().appendTo ".imgslideshow"), 6000
  

  
