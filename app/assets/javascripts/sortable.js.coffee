$(document).ready ->
  $("#scroll-players > .draggable-players").draggable
    helper: "clone"
    connectToSortable: ".sortable-players"
    revert: "invalid"
    snap: "#drop_here td"
    start: (e, ui) ->
      $(ui.helper).addClass("ui-draggable-helper")

  $(".sortable-teams").sortable
    revert: true

  $(".sortable-players").sortable
    revert: true

  $(".sortable-players").droppable
    revert: "invalid"
    drop: (e, ui) ->
      $.ajax
        type: 'put'
        url: "/teams/" + $(this).data("team-id")
        data:
          player_id: ui.draggable.data('player-id')
