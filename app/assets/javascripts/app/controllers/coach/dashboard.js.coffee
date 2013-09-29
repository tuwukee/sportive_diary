window.coachDashboardCtrlProvider = (app) ->

  app.controller "CoachDashboardnCtrl", ['$scope', 'PlayersFactory', ($scope, PlayersFactory) ->
    $scope.selectPlayer = (id) ->
      PlayersFactory.get {id: id}, (data)->
        $scope.player = data["player"]
  ]
