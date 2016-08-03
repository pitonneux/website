class HomepageScroll
  constructor: ->
    $(document).on 'ready page:load', @onLoad

  onLoad: =>
    @scope = $('body[data-action="home"]')
    return if @scope.length == 0

    @scroll()

  scroll: ->
    do (jQuery) ->
      jQuery.mark = jump: (options) ->
        defaults = selector: 'nav ul li a, .logo'
        if typeof options == 'string'
          defaults.selector = options
        options = jQuery.extend(defaults, options)
        jQuery(options.selector).click (e) ->
          jumpobj = jQuery @
          if jumpobj.attr('href') == "/"
            target = "#"
            offset = 0
          else
            target = jumpobj.attr('href')
            offset = jQuery(target).offset().top
          thespeed = 1000
          jQuery('html,body').animate { scrollTop: offset }, thespeed, 'swing'
          e.preventDefault()

    jQuery ->
      jQuery.mark.jump()

new HomepageScroll()
