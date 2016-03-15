$(document).on 'ready page:load', ->
  menuToggle = $('.toggle').unbind()
  menuToggle.on 'click', (e) ->
    e.preventDefault()
    $('ul').slideToggle ->
      if $('ul').is(':hidden')
        $('ul').removeAttr 'style'
      return
    return
  return
