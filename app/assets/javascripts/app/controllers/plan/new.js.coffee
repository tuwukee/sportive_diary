window.newPlanCtrlProvider = (app) ->

  app.controller "NewPlanCtrl", ['$scope', 'DrillsFactory', 'PlansFactory', ($scope, DrillsFactory, PlansFactory) ->
    DrillsFactory.query (data) ->
      $scope.drills = data
      $scope.selected_drill = data[0]

    $scope.plan =
      name: ""
      description: ""

    $scope.selectDrill = (drill) ->
      $scope.selected_drill = drill

    $scope.savePlan = () ->
      if $scope.plan.name
        PlansFactory.save $scope.plan
      $scope.plan =
        name: ""
        description: ""
  ]
