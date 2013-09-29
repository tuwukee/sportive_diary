window.manageTeamsCtrlProvider = (app) ->

  app.controller "ManageTeamsCtrl", ['$scope', '$modal', 'TeamsFactory', 'PlayersFactory', ($scope, $modal, TeamsFactory, PlayersFactory) ->
    TeamsFactory.query (data) ->
      $scope.groups = data
    PlayersFactory.query (data) ->
      $scope.players = data

    $scope.open = ->
      modalInstance = $modal.open(
        templateUrl: "myModalContent.html"
        controller: 'ModalCtrl'
      )

      modalInstance.result.then (data) ->
        team =
          team: data
        TeamsFactory.save team,
        (success_data) ->
          $scope.groups.push success_data
  ]
