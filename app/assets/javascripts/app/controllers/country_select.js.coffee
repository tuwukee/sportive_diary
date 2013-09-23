window.countrySelectCtrlProvider = (app) ->

  app.controller "CountrySelectCtrl", ['$scope', '$rootScope', ($scope, $rootScope) ->
    $scope.countries = []

    compare = (a, b) ->
      if a.country <= b.country
        return -1
      else
        return 1

    $.get("../assets/app/data/cities.json")
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
  ]