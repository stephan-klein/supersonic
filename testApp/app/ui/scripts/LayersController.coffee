angular
  .module('ui')
  .controller 'LayersController', ($scope, $q, supersonic) ->
    view = supersonic.ui.view("http://google.com", "myView")

    $scope.navigateTo = ->
      supersonic.ui.layers.push(view).then ()->
        supersonic.logger.log "myView pushed as a layer"

    $scope.pop = ()->
      supersonic.ui.layers.pop().then ()->
        supersonic.logger.log "Layer popped successfully"

    $scope.popAll = ()->
      supersonic.ui.layers.popAll().then ()->
        supersonic.logger.log "All the layers popped successfully"

    $scope.navigateToWithCallback = (url)->
      supersonic.ui.layers.push view,
        onSuccess: ->
          supersonic.logger.log "myView pushed as a layer"
        onFailure: (message) ->
          alert "Could not push the layer! \n\n #{JSON.stringify(message)}"

    $scope.popWithCallback = ()->
      supersonic.ui.layers.pop
        onSuccess: ->
          supersonic.logger.log "Layer popped successfully"
        onFailure: (message) ->
          alert "Could not pop a layer! \n\n #{JSON.stringify(message)}"
        

    $scope.popAllWithCallback = ()->
      supersonic.ui.layers.popAll
        onSuccess: ->
          supersonic.logger.log "All the layers popped successfully"
        onFailure: (message) ->
          alert "Could not pop the layers! \n\n #{JSON.stringify(message)}"
