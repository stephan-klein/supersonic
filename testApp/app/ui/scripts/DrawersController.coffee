angular
  .module('ui')
  .controller 'DrawersController', ($scope, $q, supersonic) ->

    supersonic.ui.drawer.updateOptions
      shadow: true
      animation: "parallax"

    $scope.asLeftDrawer = (url, width)->
      supersonic.logger.log "Creating left drawer #{url}"
      supersonic.ui.drawer.init(supersonic.ui.view(url), {width: width, side: "left"})

    $scope.asRightDrawer = (url, width)->
      supersonic.logger.log "Creating right drawer #{url}"
      supersonic.ui.drawer.init(supersonic.ui.view(url), {width: width, side: "right"})
