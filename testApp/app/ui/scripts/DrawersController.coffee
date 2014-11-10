angular
  .module('ui')
  .controller 'DrawersController', ($scope, $q, $timeout, supersonic) ->

    supersonic.ui.drawers.updateOptions
      shadow: true
      animation: "parallax"

    $scope.asLeftDrawer = (url, width)->
      supersonic.logger.log "Creating left drawer #{url}"
      supersonic.ui.drawers.init(supersonic.ui.view(url), {width: width, side: "left"})
        .catch (e)->
          supersonic.logger.error "Error #{e}"

    $scope.asRightDrawer = (url, width)->
      supersonic.logger.log "Creating right drawer #{url}"
      supersonic.ui.drawers.init(supersonic.ui.view(url), {width: width, side: "right"})
        .catch (e)->
          supersonic.logger.error "Error #{e}"


    $scope.openLeft = ->
      supersonic.ui.drawers.open()

    $scope.openRight = ->
      supersonic.ui.drawers.open("right")

    $scope.close = ->
      supersonic.ui.drawers.close()

    $scope.willShowCount = 0
    $scope.didShowCount = 0
    $scope.willCloseCount = 0
    $scope.didCloseCount = 0
    $scope.willShowListener = null
    $scope.didShowListener = null
    $scope.willCloseListener = null
    $scope.didCloseListener = null
    $scope.listenChanges = ->
      $scope.willShowListener = supersonic.ui.drawers.whenWillShow ->
        $timeout ->
          $scope.willShowCount += 1
      $scope.didShowListener = supersonic.ui.drawers.whenDidShow ->
        $timeout ->
          $scope.didShowCount += 1
      $scope.willCloseListener = supersonic.ui.drawers.whenWillClose ->
        $timeout ->
          $scope.willCloseCount += 1
      $scope.didCloseListener = supersonic.ui.drawers.whenDidClose ->
        $timeout ->
          $scope.didCloseCount += 1

    $scope.stopListeningChanges = ->
      $scope.willShowListener() if $scope.willShowListener?
      $scope.didShowListener() if $scope.didShowListener?
      $scope.willCloseListener() if $scope.willCloseListener?
      $scope.didCloseListener() if $scope.didCloseListener?

      $scope.willShowListener = null
      $scope.didShowListener = null
      $scope.willCloseListener = null
      $scope.didCloseListener = null
