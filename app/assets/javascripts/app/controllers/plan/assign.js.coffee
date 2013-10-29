window.assignPlanCtrlProvider = (app) ->

  app.controller "AssignPlanCtrl", ['$scope', 'PlansFactory', ($scope, PlansFactory) ->
    coach_id = angular.element("#coach-id").data("id")
    commonFilter = (plan) ->
      plan.coach_id is 0
    currentFilter = (plan) ->
      plan.coach_id is coach_id

    PlansFactory.query (data) ->
      $scope.common_plans =  data.filter(commonFilter)
      $scope.current_plans =  data.filter(currentFilter)

    $scope.selectPlan = (plan) ->
      $scope.selected_plan = plan

  ]
