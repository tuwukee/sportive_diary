#= require app/controllers/coach/dashboard
#= require app/controllers/country_select

"use strict"

app = angular.module("spdiary", [])

#InitApplication
coachDashboardCtrlProvider(app)
countrySelectCtrlProvider(app)
