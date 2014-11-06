angular
  .module('ui')
  .controller 'DrawersController', ($scope, $q, supersonic) ->

    supersonic.ui.drawers.updateOptions
      shadow: true
      animation: "parallax"

    $scope.asLeftDrawer = (url, width)->
      supersonic.logger.log "Creating left drawer #{url}"
      supersonic.ui.drawers.init(supersonic.ui.view(url), {width: width, side: "left"})

    $scope.asRightDrawer = (url, width)->
      supersonic.logger.log "Creating right drawer #{url}"
      supersonic.ui.drawers.init(supersonic.ui.view(url), {width: width, side: "right"})

    $scope.openLeft = ->
      supersonic.ui.drawers.open()

    $scope.openRight = ->
      supersonic.ui.drawers.open("right")

    $scope.close = ->
      supersonic.ui.drawers.close()
