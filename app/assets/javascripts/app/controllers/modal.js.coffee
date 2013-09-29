window.modalCtrlProvider = (app) ->

  app.controller "ModalCtrl", ['$scope', '$modalInstance', ($scope, $modalInstance) ->
    $scope.team =
      name: ''
      description: ''

    $scope.ok = ->
      $modalInstance.close $scope.team

    $scope.cancel = ->
      $modalInstance.dismiss "cancel"
  ]