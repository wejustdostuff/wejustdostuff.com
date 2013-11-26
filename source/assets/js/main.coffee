#= require jquery/jquery
#= require ajaxchimp/jquery.ajaxchimp
#= require fixedmenu
#= require sass-bootstrap/js/collapse
#= require sass-bootstrap/js/transition
#= require sass-bootstrap/js/modal


$(window).load ->
  $("#mailchimpform").ajaxChimp
    url: "http://wejustdostuff.us7.list-manage.com/subscribe/post?u=9d88ce76bb9c9bb3bea3601f0&id=2e63c2f86c"


$(document).ready ->
  mainMenu = new $.fixedmenu($(".navigation"),
    duration: 500
    easing: "swing"
    topmargin: 70
  )
  mainMenu.foo_public_method()


  $(".gradientcontent .gradient:gt(0)").hide()
  setInterval (->
    $(".gradientcontent :first-child").fadeOut(18000).next(".gradient").fadeIn(18000).end().appendTo ".gradientcontent"
  ), 20000