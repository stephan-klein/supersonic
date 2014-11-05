angular
  .module('ui')
  .controller 'AnimateController', ($scope, $q, supersonic) ->

    $scope.testPromises = ->
      supersonic.ui.animate("slideFromRight", {duration: 5.0})
        .perform()
        .then (status)->
          status.started.then ->
            supersonic.logger.log "Animation started."
          status.ended.then ->
            supersonic.logger.log "Animation ended."
        .catch (err)->
          supersonic.logger.error "Could not animate: #{JSON.stringify(err)}"
