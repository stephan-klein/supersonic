angular
  .module('ui')
  .controller 'DialogsController', ($scope, supersonic) ->

    $scope.testShowSpinnerBlockingApp = ->
      options =
        block: "app"
        animated: false

      supersonic.ui.dialog.spinner.show("Blocking the app...", options).then ->
        supersonic.logger.log "Spinner displayed."
        setTimeout ->
          supersonic.ui.dialog.spinner.hide(options).then ->
            supersonic.logger.log "Spinner closed."
        ,
         3000

    $scope.testShowSpinnerBlockingWebView = ->
      supersonic.ui.dialog.spinner.show("Blocking the webview...").then ->
        supersonic.logger.log "Spinner displayed."
        setTimeout ->
          supersonic.ui.dialog.spinner.hide().then ->
            supersonic.logger.log "Spinner closed."
        ,
         3000
