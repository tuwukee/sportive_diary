$(document).ready ->
  (($) ->
    jQuery.fn.extend slimScroll: (options) ->
      defaults =

        # width in pixels of the visible scroll area
        width: "auto"

        # height in pixels of the visible scroll area
        height: "250px"

        # width in pixels of the scrollbar and rail
        size: "7px"

        # scrollbar color, accepts any hex/color value
        color: "#000"

        # scrollbar position - left/right
        position: "right"

        # distance in pixels between the side edge and the scrollbar
        distance: "1px"

        # default scroll position on load - top / bottom / $('selector')
        start: "top"

        # sets scrollbar opacity
        opacity: .4

        # enables always-on mode for the scrollbar
        alwaysVisible: false

        # check if we should hide the scrollbar when user is hovering over
        disableFadeOut: false

        # sets visibility of the rail
        railVisible: false

        # sets rail color
        railColor: "#333"

        # sets rail opacity
        railOpacity: .2

        # whether  we should use jQuery UI Draggable to enable bar dragging
        railDraggable: true

        # defautlt CSS class of the slimscroll rail
        railClass: "slimScrollRail"

        # defautlt CSS class of the slimscroll bar
        barClass: "slimScrollBar"

        # defautlt CSS class of the slimscroll wrapper
        wrapperClass: "slimScrollDiv"

        # check if mousewheel should scroll the window if we reach top/bottom
        allowPageScroll: false

        # scroll amount applied to each mouse wheel step
        wheelStep: 20

        # scroll amount applied when user is using gestures
        touchScrollStep: 200

        # sets border radius
        borderRadius: "7px"

        # sets border radius of the rail
        railBorderRadius: "7px"

      o = $.extend(defaults, options)

      # do it for every element that matches selector
      @each ->


        _onWheel = (e) ->

          # use mouse wheel only when mouse is over
          return  unless isOverPanel
          e = e or window.event
          delta = 0
          delta = -e.wheelDelta / 120  if e.wheelDelta
          delta = e.detail / 3  if e.detail
          target = e.target or e.srcTarget or e.srcElement

          # scroll content
          scrollContent delta, true  if $(target).closest("." + o.wrapperClass).is(me.parent())

          # stop window scroll
          e.preventDefault()  if e.preventDefault and not releaseScroll
          e.returnValue = false  unless releaseScroll
        scrollContent = (y, isWheel, isJump) ->
          releaseScroll = false
          delta = y
          maxTop = me.outerHeight() - bar.outerHeight()
          if isWheel

            # move bar with mouse wheel
            delta = parseInt(bar.css("top")) + y * parseInt(o.wheelStep) / 100 * bar.outerHeight()

            # move bar, make sure it doesn't go out
            delta = Math.min(Math.max(delta, 0), maxTop)

            # if scrolling down, make sure a fractional change to the
            # scroll position isn't rounded away when the scrollbar's CSS is set
            # this flooring of delta would happened automatically when
            # bar.css is set below, but we floor here for clarity
            delta = (if (y > 0) then Math.ceil(delta) else Math.floor(delta))

            # scroll the scrollbar
            bar.css top: delta + "px"

          # calculate actual scroll amount
          percentScroll = parseInt(bar.css("top")) / (me.outerHeight() - bar.outerHeight())
          delta = percentScroll * (me[0].scrollHeight - me.outerHeight())
          if isJump
            delta = y
            offsetTop = delta / me[0].scrollHeight * me.outerHeight()
            offsetTop = Math.min(Math.max(offsetTop, 0), maxTop)
            bar.css top: offsetTop + "px"

          # scroll content
          me.scrollTop delta

          # fire scrolling event
          me.trigger "slimscrolling", ~~delta

          # ensure bar is visible
          showBar()

          # trigger hide when scroll is stopped
          hideBar()
        attachWheel = ->
          if window.addEventListener
            @addEventListener "DOMMouseScroll", _onWheel, false
            @addEventListener "mousewheel", _onWheel, false
            @addEventListener "MozMousePixelScroll", _onWheel, false
          else
            document.attachEvent "onmousewheel", _onWheel
        getBarHeight = ->

          # calculate scrollbar height and make sure it is not too small
          barHeight = Math.max((me.outerHeight() / me[0].scrollHeight) * me.outerHeight(), minBarHeight)
          bar.css height: barHeight + "px"

          # hide scrollbar if content is not long enough
          display = (if barHeight is me.outerHeight() then "none" else "block")
          bar.css display: display
        showBar = ->

          # recalculate bar height
          getBarHeight()
          clearTimeout queueHide

          # when bar reached top or bottom
          if percentScroll is ~~percentScroll

            #release wheel
            releaseScroll = o.allowPageScroll

            # publish approporiate event
            unless lastScroll is percentScroll
              msg = (if (~~percentScroll is 0) then "top" else "bottom")
              me.trigger "slimscroll", msg
          else
            releaseScroll = false
          lastScroll = percentScroll

          # show only when required
          if barHeight >= me.outerHeight()

            #allow window scroll
            releaseScroll = true
            return
          bar.stop(true, true).fadeIn "fast"
          rail.stop(true, true).fadeIn "fast"  if o.railVisible
        hideBar = ->

          # only hide when options allow it
          unless o.alwaysVisible
            queueHide = setTimeout(->
              if not (o.disableFadeOut and isOverPanel) and not isOverBar and not isDragg
                bar.fadeOut "slow"
                rail.fadeOut "slow"
            , 1000)
        isOverPanel = undefined
        isOverBar = undefined
        isDragg = undefined
        queueHide = undefined
        touchDif = undefined
        barHeight = undefined
        percentScroll = undefined
        lastScroll = undefined
        divS = "<div></div>"
        minBarHeight = 30
        releaseScroll = false
        me = $(this)
        if me.parent().hasClass(o.wrapperClass)
          offset = me.scrollTop()
          bar = me.parent().find("." + o.barClass)
          rail = me.parent().find("." + o.railClass)
          getBarHeight()
          if $.isPlainObject(options)
            if "height" of options and options.height is "auto"
              me.parent().css "height", "auto"
              me.css "height", "auto"
              height = me.parent().parent().height()
              me.parent().css "height", height
              me.css "height", height
            if "scrollTo" of options
              offset = parseInt(o.scrollTo)
            else if "scrollBy" of options
              offset += parseInt(o.scrollBy)
            else if "destroy" of options
              bar.remove()
              rail.remove()
              me.unwrap()
              return
            scrollContent offset, false, true
          return
        o.height = (if (o.height is "auto") then me.parent().height() else o.height)
        wrapper = $(divS).addClass(o.wrapperClass).css(
          position: "relative"
          overflow: "hidden"
          width: o.width
          height: o.height
        )
        me.css
          overflow: "hidden"
          width: o.width
          height: o.height

        rail = $(divS).addClass(o.railClass).css(
          width: o.size
          height: "100%"
          position: "absolute"
          top: 0
          display: (if (o.alwaysVisible and o.railVisible) then "block" else "none")
          "border-radius": o.railBorderRadius
          background: o.railColor
          opacity: o.railOpacity
          zIndex: 90
        )
        bar = $(divS).addClass(o.barClass).css(
          background: o.color
          width: o.size
          position: "absolute"
          top: 0
          opacity: o.opacity
          display: (if o.alwaysVisible then "block" else "none")
          "border-radius": o.borderRadius
          BorderRadius: o.borderRadius
          MozBorderRadius: o.borderRadius
          WebkitBorderRadius: o.borderRadius
          zIndex: 99
        )
        posCss = (if (o.position is "right") then right: o.distance else left: o.distance)
        rail.css posCss
        bar.css posCss
        me.wrap wrapper
        me.parent().append bar
        me.parent().append rail
        if o.railDraggable
          bar.bind("mousedown", (e) ->
            $doc = $(document)
            isDragg = true
            t = parseFloat(bar.css("top"))
            pageY = e.pageY
            $doc.bind "mousemove.slimscroll", (e) ->
              currTop = t + e.pageY - pageY
              bar.css "top", currTop
              scrollContent 0, bar.position().top, false

            $doc.bind "mouseup.slimscroll", (e) ->
              isDragg = false
              hideBar()
              $doc.unbind ".slimscroll"

            false
          ).bind "selectstart.slimscroll", (e) ->
            e.stopPropagation()
            e.preventDefault()
            false

        rail.hover (->
          showBar()
        ), ->
          hideBar()

        bar.hover (->
          isOverBar = true
        ), ->
          isOverBar = false

        me.hover (->
          isOverPanel = true
          showBar()
          hideBar()
        ), ->
          isOverPanel = false
          hideBar()

        me.bind "touchstart", (e, b) ->
          touchDif = e.originalEvent.touches[0].pageY  if e.originalEvent.touches.length

        me.bind "touchmove", (e) ->
          e.originalEvent.preventDefault()  unless releaseScroll
          if e.originalEvent.touches.length
            diff = (touchDif - e.originalEvent.touches[0].pageY) / o.touchScrollStep
            scrollContent diff, true
            touchDif = e.originalEvent.touches[0].pageY

        getBarHeight()
        if o.start is "bottom"
          bar.css top: me.outerHeight() - bar.outerHeight()
          scrollContent 0, true
        else if o.start isnt "top"
          scrollContent $(o.start).position().top, null, true
          bar.hide()  unless o.alwaysVisible
        attachWheel()


      # maintain chainability
      this

    jQuery.fn.extend slimscroll: jQuery.fn.slimScroll
  ) jQuery

  $scroll = $('#scroll-players')
  if $scroll.height() > 240
    $scroll.slimscroll({ height: '240px' })

  $scroll = $('#scroll-players-index')
  if $scroll.height() > 387
    $scroll.slimscroll({ height: '387px' })
