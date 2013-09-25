#= require app/assists/angular-resource.min
#= require app/assists/ui-bootstrap-custom-0.6.0.min
#= require app/assists/ui-bootstrap-custom-tpls-0.6.0.min
#= require app/controllers/coach/dashboard
#= require app/controllers/profile_edit
#= require app/factories

"use strict"

app = angular.module("spdiary", ['ui.bootstrap', 'spFactories'])

#InitApplication
coachDashboardCtrlProvider(app)
profileEditCtrlProvider(app)
