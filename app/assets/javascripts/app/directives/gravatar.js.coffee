"use strict"

app = angular.module("ui-gravatar", ["md5"])

app.factory "gravatarImageService", [ "md5", (md5) ->

  getImageSrc: (value, size, rating, defaultUrl, secure) ->
    hash = md5.createHash(value.toLowerCase())
    src = ((if secure then "https://secure" else "http://www")) + ".gravatar.com/avatar/" + hash + "?s=" + size + "&r=" + rating + "&d=" + defaultUrl
    src
]

app.directive "playerGravatarImage", ["gravatarImageService", (gravatarImageService) ->

  restrict: "EAC"

  link: (scope, elm, attrs) ->
    scope.$watch "player", ((value) ->
      if value instanceof Array
        size = attrs.gravatarSize or 140
        rating = attrs.gravatarRating or "pg"
        defaultUrl = attrs.gravatarDefault or "http://s7.postimg.org/yd5zz41rr/profile.png"
        cssClass = attrs.gravatarCssClass or "gravatar-icon"
        src = gravatarImageService.getImageSrc(value[0].email, size, rating, defaultUrl, attrs.gravatarSecure)
        tag = "<img class=\"" + cssClass + "\" src=\"" + src + "\" >"
        elm.find("img").remove()
        elm.append tag
    ), true
]

app.directive "coachGravatarImage", ["gravatarImageService", (gravatarImageService) ->

  restrict: "EAC"

  link: (scope, elm, attrs) ->
    size = attrs.gravatarSize or 140
    rating = attrs.gravatarRating or "pg"
    defaultUrl = attrs.gravatarDefault or "http://s7.postimg.org/yd5zz41rr/profile.png"
    cssClass = attrs.gravatarCssClass or "gravatar-icon"
    src = gravatarImageService.getImageSrc(attrs.gravatarEmail, size, rating, defaultUrl, attrs.gravatarSecure)
    tag = "<img class=\"" + cssClass + "\" src=\"" + src + "\" >"
    elm.find("img").remove()
    elm.append tag
]