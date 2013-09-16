$(document).ready ->
  $(".sortable").sortable
    start: (event, ui) ->
      ui.item.startPos = ui.item.index()

    stop: (event, ui) ->
      console.log "Start position: " + ui.item.startPos
      console.log "New position: " + ui.item.index()