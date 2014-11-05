angular
  .module('ui')
  .controller 'AnimateController', ($scope, $q, supersonic) ->
    $scope.animations = [
      "curlDown"
      "curlUp"
      "fade"
      "flipHorizontalFromRight"
      "flipHorizontalFromLeft"
      "flipVerticalFromTop"
      "flipVerticalFromBottom"
      "slideFromTop"
      "slideFromRight"
      "slideFromLeft"
      "slideFromBottom"
    ]

    $scope.animate = (animation)->
      supersonic.ui.animate(animation, {duration: 1.0}).perform()


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
