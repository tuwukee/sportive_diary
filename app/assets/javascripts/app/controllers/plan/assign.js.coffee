window.assignPlanCtrlProvider = (app) ->

  app.controller "AssignPlanCtrl", ['$scope', 'PlansFactory', 'TeamsFactory', 'PlayersFactory', ($scope, PlansFactory, TeamsFactory, PlayersFactory) ->
    coach_id = angular.element("#coach-id").data("id")
    commonFilter = (item) ->
      item.coach_id is 0
    currentFilter = (item) ->
      item.coach_id is coach_id

    $scope.items = ['Team', 'Player'];
    $scope.selection = $scope.items[0];

    PlansFactory.query (data) ->
      $scope.common_plans =  data.filter(commonFilter)
      $scope.current_plans =  data.filter(currentFilter)
      $scope.selected_plan = $scope.common_plans[0]

    TeamsFactory.query (data) ->
      $scope.teams =  data.filter(currentFilter)

    PlayersFactory.query (data) ->
      $scope.players =  data.filter(currentFilter)

    $scope.selectPlan = (plan) ->
      $scope.selected_plan = plan

  ]
