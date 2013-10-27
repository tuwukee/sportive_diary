'use strict'

angular.module('app.factories', ['ngResource'])
.factory("PlayersFactory", ["$resource", ($resource) ->
  $resource("players/:id", {id: "@id"}, {
    update: {method: 'PUT'},
    query:  { method:'GET', isArray:true}
  })
])
.factory("TeamsFactory", ["$resource", ($resource) ->
  TeamsFactory = $resource("teams/:id", {id: "@id"},  {
    update: { method: 'PUT' },
    save:   { method:'POST' },
    query:  { method:'GET', isArray:true}
  })
])
.factory("DrillsFactory", ["$resource", ($resource) ->
  TeamsFactory = $resource("drills/:id", {id: "@id"},  {
    update: { method: 'PUT' },
    query:  { method:'GET', isArray:true}
  })
])

