$ ->
    console.log "Index loaded"

    $("a[data-remote]").on "ajax:beforeSend", (event) ->
        console.log "Event #{event} is going to be sent"