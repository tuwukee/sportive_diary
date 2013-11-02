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

app.directive 'droppedPlan', ->
  link: (scope, elm, attrs, ctrl) ->
    elm.ready ->

      elm.droppable
        revert: "invalid"
        drop: (e, ui) ->
          $(this).find(".placeholder").remove()
          newItem = $(ui.helper).clone(false)
            .removeClass('ui-draggable-dragging')
            .addClass('stable')
            .css({position:'relative', left:0, top:0})

          $(this).find(".no-plan").toggle()
          $(this).find(".plans").append(newItem)
          $(this).parent().find(".remove-icon").toggle()

          $(this).droppable('disable')

          url = if attrs.team then "/teams/#{$(this).data('team-id')}" else "/players/#{$(this).data('player-id')}"

          $.ajax
            type: 'put'
            url: url
            data:
              plan_id: ui.draggable.data('plan-id')
    true

app.directive 'hidePlan', ->
  link: (scope, elm, attrs, ctrl) ->
    elm.bind 'click', ->
      elm.toggle()
      area = elm.parents(".drop-area")
      area.find(".stable").remove()
      area.find(".no-plan").toggle()
      sub_area = area.find(".row").find(".w-col-9")
      sub_area.droppable('enable')

      url = if attrs.player then "/players/#{sub_area.data('player-id')}" else "/teams/#{sub_area.data('team-id')}"

      $.ajax
        type: 'put'
        url: url
        data:
          remove_plan: true
    true