angular
  .module('ui')
  .controller 'LayersController', ($scope, $q, supersonic) ->
    view = new supersonic.ui.View "http://google.com"

    $scope.navigateTo = ->
      supersonic.ui.layers.push(view).then () ->
        supersonic.logger.log "myView pushed as a layer"

    $scope.navigateWithAnimation = ->
      customAnimation = supersonic.ui.animate "flipHorizontalFromLeft"
      supersonic.ui.layers.push(view, animation: customAnimation).then () ->
        supersonic.logger.log "myView pushed as a layer with custom animation"

    $scope.pop = () ->
      supersonic.ui.layers.pop().then () ->
        supersonic.logger.log "Layer popped successfully"

    $scope.popAll = () ->
      supersonic.ui.layers.popAll().then () ->
        supersonic.logger.log "All the layers popped successfully"

    $scope.navigateToWithCallback = (url) ->
      supersonic.ui.layers.push view,
        onSuccess: ->
          supersonic.logger.log "myView pushed as a layer"
        onFailure: (message) ->
          supersonic.ui.dialog.alert "Could not push the layer! \n\n #{JSON.stringify(message)}"

    $scope.popWithCallback = () ->
      supersonic.ui.layers.pop
        onSuccess: ->
          supersonic.logger.log "Layer popped successfully"
        onFailure: (message) ->
          supersonic.ui.dialog.alert "Could not pop a layer! \n\n #{JSON.stringify(message)}"


    $scope.popAllWithCallback = () ->
      supersonic.ui.layers.popAll
        onSuccess: ->
          supersonic.logger.log "All the layers popped successfully"
        onFailure: (message) ->
          supersonic.ui.dialog.alert "Could not pop the layers! \n\n #{JSON.stringify(message)}"

    $scope.replaceWithIndex = () ->
      supersonic.ui.layers.replace "http://localhost/app/common/index.html"
      .then ->
        supersonic.logger.log "Layer stack replaced successfully!"
      .catch (error) ->
        supersonic.logger.log error

    $scope.testIsDisposibleApi = ->

      supersonic.ui.isDisposable = -> false

      # new event used to know when the webview navigation was blocked
      eventHandler = supersonic.ui.views.current.on 'blocked', (event) ->
        supersonic.ui.dialog.spinner.show "Saving..."
        setTimeout ->
          supersonic.ui.isDisposable = -> true
          supersonic.ui.views.current.off 'blocked', eventHandler

          supersonic.ui.dialog.spinner.hide()
          if event.trigger == "pop_layer"
            supersonic.ui.layers.pop()
        , 2000
