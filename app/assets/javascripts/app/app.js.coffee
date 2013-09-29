#= require app/assists/angular-resource.min
#= require app/assists/ui-bootstrap-custom-0.6.0.min
#= require app/assists/ui-bootstrap-custom-tpls-0.6.0.min
#= require app/controllers/coach/dashboard
#= require app/controllers/coach/manage_teams
#= require app/controllers/profile_edit
#= require app/controllers/modal
#= require app/factories
#= require app/directives/dragdrop

"use strict"

app = angular.module("spdiary", ['ui.bootstrap', 'app.factories', 'app.directives'])

#InitApplication
modalCtrlProvider(app)
coachDashboardCtrlProvider(app)
manageTeamsCtrlProvider(app)
profileEditCtrlProvider(app)

