

(($) ->
  $.fixedmenu = (el, options) ->
    defaults =
      duration: 500
      easing: "linear"
      topmargin: 50

    plugin = this
    plugin.settings = {}
    areas = []
    currentAreaIndex = -1

    # --- Contructor -------------------------------------------------------------------------
    init = ->
      plugin.settings = $.extend({}, defaults, options)
      plugin.el = el

      # plugin.el is the element we receive when initialized
      $menu = plugin.el

      # iterate through children to retrieve the menu links
      $menu.children().each (index, element) ->

        # jquerinize element
        $child = $(element)

        # find the a tag
        $link = $child.find("a")
        $target = $(document).find($link.attr("href"))

        areas.push $target.offset().top

        # register click event to prevent default behaviour and use custom one
        $link.click menuLink_clickHandler

      $(document).scroll html_scrollHandler
      html_scrollHandler()


    # --- Public methods ---------------------------------------------------------------------
    plugin.foo_public_method = ->


      # --- Private methods --------------------------------------------------------------------
    menuLink_clickHandler = (event) ->

      # get the clicked a element
      $clickedA = $(this)

      # find the linked element in the body
      $target = $(document).find($clickedA.attr("href"))

      # animate the scroll position
      $("html, body").animate

        scrollTop: ( $target.offset().top - parseInt(plugin.settings.topmargin) )
      , plugin.settings.duration, plugin.settings.easing

      # preventing default
      event.preventDefault()

    html_scrollHandler = (event) ->

      # get current scroll top position
      areaIndex = undefined
      scrollTop = $(document).scrollTop() + parseInt(plugin.settings.topmargin+1)

      # find relative area index
      $(areas).each (index, element) ->
        return false  if element > scrollTop
        areaIndex = index


      # don't do nothing if already same index
      return  if currentAreaIndex is areaIndex

      # remove all active classes first
      $(plugin.el).children().removeClass "active"

      # add active class to current area
      child = $(plugin.el).children().get(areaIndex)
      $(child).addClass "active"

      # rememeber current area index
      currentAreaIndex = areaIndex

    init()
) jQuery