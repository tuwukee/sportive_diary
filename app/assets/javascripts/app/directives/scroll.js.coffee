"use strict"

app = angular.module("scrolls", [])

app.directive "scroll", ->
  link: (scope, elm, attrs) ->
   if scope.$last
   	  height = parseInt(attrs.height, 10)
      elm.ready ->
        $elm = $(elm).parent()
        if $elm.height() > height
          $elm.slimscroll({ height: "#{height}px", wheelStep: 1 })
    true

app.directive "accordionScroll", ->
  link: (scope, elm, attrs) ->
   if scope.$last
   	  height = parseInt(attrs.height, 10)
      elm.ready ->
        $elm = $(elm).closest(".accordion")
        if $elm.height() > height
          $elm.slimscroll({ height: "#{height}px", wheelStep: 1 })
    true

