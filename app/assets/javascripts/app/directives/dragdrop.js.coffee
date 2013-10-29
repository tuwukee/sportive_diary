app = angular.module('app.directives', [])

app.directive 'draggedItem', ->
  link: (scope, elm, attrs, ctrl) ->
    elm.ready ->
      elm.draggable
        items: "li"
        helper: "clone"
        revert: "invalid"
        start: (e, ui) ->
          $(ui.helper).addClass("ui-draggable-helper")
    true

app.directive 'droppedItem', ->
  link: (scope, elm, attrs, ctrl) ->
    elm.ready ->
      elm.droppable
        revert: "invalid"
        drop: (e, ui) ->
          $(this).find(".placeholder").remove()
          newItem = $(ui.helper).clone(false)
            .removeClass('ui-draggable-dragging')
            .css({position:'relative', left:0, top:0})
          newItem.attr("ng-dblclick","removePlayer(player, group); deleted = ! deleted")
          $(this).append(newItem)

          $.ajax
            type: 'put'
            url: "/teams/" + $(this).data("team-id")
            data:
              player_id: ui.draggable.data('player-id')
    true
