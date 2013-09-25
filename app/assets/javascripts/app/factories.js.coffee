'use strict'

angular.module('spFactories', ['ngResource'])
.factory "PlayersFactory", ["$resource", ($resource) ->
  $resource("players/:id", {id: "@id"}, {update: {method: 'PUT'}})
]