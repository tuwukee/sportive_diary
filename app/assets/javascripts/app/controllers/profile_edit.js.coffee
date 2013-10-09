window.profileEditCtrlProvider = (app) ->

  app.controller "ProfileEditCtrl", ['$scope', '$timeout', ($scope, $timeout) ->
    $scope.countries = []
    $scope.dt = new Date(-1)
    $scope.minDate = new Date(-1640000000000)

    compare = (a, b) ->
      if a.country <= b.country
        return -1
      else
        return 1

    $.get("http://#{document.location.host.toString()}/assets/app/data/cities.json")
      .success (data) ->
        map = {}
        countries = {}
        data.forEach (value) ->
          map[value.country] = map[value.country] or country: value.country
          map[value.country]['cities'] ||= []
          map[value.country]['cities'].push value.title

          countries = Object.keys(map).map((key) ->
            map[key]
          )

        $scope.countries = countries.sort compare
        $scope.$apply()

    $scope.today = ->
      $scope.dt = new Date()

    $scope.showWeeks = true

    $scope.toggleWeeks = ->
      $scope.showWeeks = not $scope.showWeeks

    $scope.clear = ->
      $scope.dt = null

    $scope.disabled = (date, mode) ->
      mode is "day" and (date > new Date())

    $scope.open = ->
      $timeout ->
        $scope.opened = true


    $scope.dateOptions =
      "year-format": "'yy'"
      "starting-day": 1
  ]