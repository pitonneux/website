$(document).on 'ready page:load', ->

  menuToggle = $('.menu-toggle').unbind()
  menuToggle.on 'click', (e) ->
    e.preventDefault()
    $('nav ul').slideToggle ->
      if $('nav ul').is(':hidden')
        $('nav ul').removeAttr 'style'
