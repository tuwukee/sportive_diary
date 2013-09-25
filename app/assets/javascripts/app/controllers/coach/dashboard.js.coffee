window.coachDashboardCtrlProvider = (app) ->

  app.controller "CoachDashboardnCtrl", ['$scope', 'PlayersFactory', ($scope, PlayersFactory) ->
    $scope.selectPlayer = (id = 1) ->
      PlayersFactory.get {id: id}, (data)->
        $scope.player = data["player"]
  ]
