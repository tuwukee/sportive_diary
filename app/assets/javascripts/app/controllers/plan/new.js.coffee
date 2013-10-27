window.newPlanCtrlProvider = (app) ->

  app.controller "NewPlanCtrl", ['$scope', 'DrillsFactory', ($scope, DrillsFactory) ->
    DrillsFactory.query (data) ->
      $scope.drills = data
      $scope.selected_drill = data[0]
  ]
