$(document).on 'ready page:load', ->
  $('.expander-toggle').click ->
    $(this).siblings().toggleClass 'closed'
