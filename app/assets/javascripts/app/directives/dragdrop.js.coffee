app = angular.module('app.directives', [])

app.directive 'draggedItem', ->
  link: (scope, elm, attrs, ctrl) ->
    elm.ready ->
      elm.draggable
        items: "li"
        helper: "clone"
        revert: "invalid"
        connectToSortable: ".sortable-players"
        start: (e, ui) ->
          $(ui.helper).addClass("ui-draggable-helper")
    true

app.directive 'sortedItem', ->
  link: (scope, elm, attrs, ctrl) ->
    elm.ready ->
      elm.sortable
        revert: true

    true

app.directive 'droppedItem', ->
  link: (scope, elm, attrs, ctrl) ->
    elm.ready ->
      elm.droppable
        revert: "invalid"
        drop: (e, ui) ->
          $.ajax
            type: 'put'
            url: "/teams/" + $(this).data("team-id")
            data:
              player_id: ui.draggable.data('player-id')
    true
