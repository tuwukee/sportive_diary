window.manageTeamsCtrlProvider = (app) ->

  app.controller "ManageTeamsCtrl", ['$scope', '$modal', 'TeamsFactory', 'PlayersFactory', ($scope, $modal, TeamsFactory, PlayersFactory) ->
    TeamsFactory.query((data) ->
      $scope.groups = data
      $scope.selected_team = data[0]
      )
    $scope.players = PlayersFactory.query()
    $scope.filter = {}

    $scope.search= ->
      PlayersFactory.query( (data) ->
        $scope.players =  data.filter(playersFilter)
      )

    playersFilter = (el) ->
      ((if $scope.filter.id then parseInt($scope.filter.id) else el.id) is el.id) and
      el.profile.city.search((if $scope.filter.city then new RegExp($scope.filter.city, "i") else new RegExp(el.profile.city))) isnt -1 and
      el.profile.last_name.search((if $scope.filter.last_name then new RegExp($scope.filter.last_name, "i") else new RegExp(el.profile.last_name))) isnt -1


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

    $scope.selectTeam = (team) ->
      $scope.selected_team = team
  ]
