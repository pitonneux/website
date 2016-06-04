$(document).on 'ready page:load', ->
  $body = $('body')

  return unless $('body').data('controller') is 'pages' && $body.data('action') is 'home'

  menuToggle = $('.toggle').unbind()
  menuToggle.on 'click', (e) ->
    e.preventDefault()
    $('ul').slideToggle ->
      if $('ul').is(':hidden')
        $('ul').removeAttr 'style'
