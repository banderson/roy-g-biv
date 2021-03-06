jQuery ($) ->

  interval = null

  fetchAndChangeColor = () ->
    $.get('/colors/next').done((res) ->
      $('body')
        .css(backgroundColor: "rgb(#{res.r}, #{res.g}, #{res.b})")
        .addClass 'activated'
    ).fail (res, err, reason) ->
      console.error "An error occurred: #{res.status} - #{reason}"

  $('button').on 'click', ->
    fetchAndChangeColor()
    clearInterval interval if interval
    interval = setInterval fetchAndChangeColor, 3000
