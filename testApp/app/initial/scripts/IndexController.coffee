angular.module("initial")
  .controller 'IndexController', ($scope, $q, supersonic) ->

    $scope.showInitialView = ->
      supersonic.ui.initialView.show()

    $scope.dismissInitialView = ->
      supersonic.ui.initialView.dismiss()

    $scope.showInitialViewWithCallback = ->
      supersonic.ui.initialView.show
        onSuccess: ->
          supersonic.logger.log "Initial view shown"
        onFailure: (error) ->
          supersonic.ui.dialog.alert "Error: #{JSON.stringify error}"

    $scope.dismissInitialViewWithCallback = ->
      supersonic.ui.initialView.dismiss
        onSuccess: ->
          supersonic.logger.log "Initial view dismissed"
        onFailure: (error) ->
          supersonic.ui.dialog.alert "Error: #{JSON.stringify error}"
