$(document).on 'ready page:load', ->

  menuToggle = $('.menu-toggle').unbind()
  menuToggle.on 'click', (e) ->
    e.preventDefault()
    $('#toggle_menu').slideToggle ->
      if $('#toggle_menu').is(':hidden')
        $('#toggle_menu').removeAttr 'style'
