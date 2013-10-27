window.newPlanCtrlProvider = (app) ->

  app.controller "NewPlanCtrl", ['$scope', 'DrillsFactory', ($scope, DrillsFactory) ->
    DrillsFactory.query (data) ->
      $scope.drills = data
      $scope.selected_drill = data[0]

    $scope.selectDrill = (drill) ->
      $scope.selected_drill = drill
  ]
