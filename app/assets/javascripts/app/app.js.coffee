#= require app/assists/angular-resource.min
#= require app/assists/ui-bootstrap-custom-0.6.0.min
#= require app/assists/ui-bootstrap-custom-tpls-0.6.0.min
#= require app/controllers/coach/dashboard
#= require app/controllers/coach/manage_teams
#= require app/controllers/coach/show
#= require app/controllers/plan/new
#= require app/controllers/plan/assign
#= require app/controllers/profile_edit
#= require app/controllers/modal
#= require app/factories
#= require app/directives/dragdrop
#= require app/directives/gravatar
#= require app/directives/scroll
#= require app/services/md5-service

"use strict"

app = angular.module("spdiary", ['ui.bootstrap', 'app.factories', 'app.directives', 'ui-gravatar', 'md5', 'scrolls'])

#InitApplication
modalCtrlProvider(app)
coachDashboardCtrlProvider(app)
manageTeamsCtrlProvider(app)
profileEditCtrlProvider(app)
showCoachCtrlProvider(app)
newPlanCtrlProvider(app)
assignPlanCtrlProvider(app)
