window.modalCtrlProvider = (app) ->

  app.controller "ModalCtrl", ['$scope', '$modalInstance', ($scope, $modalInstance) ->
    $scope.team =
      name: ''
      description: ''

    $scope.player =
      email: ''

    $scope.ok = ->
      $modalInstance.close $scope.team

    $scope.add = ->
      $modalInstance.close $scope.player

    $scope.cancel = ->
      $modalInstance.dismiss "cancel"
  ]