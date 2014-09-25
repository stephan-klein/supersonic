angular
  .module('ui')
  .controller 'NavigationBarController', ($scope, $q, supersonic) ->

    $scope.hide = ()->
      supersonic.ui.navigationBar.hide({ animated: true }).then ()->
        supersonic.logger.log "promise works"

    $scope.show = ()->
      supersonic.ui.navigationBar.show().then ()->
        supersonic.logger.log "promise works"

    $scope.show2 = ()->
      supersonic.ui.navigationBar.show({ animated: true, title: "New Title" }).then ()->
        supersonic.logger.log "promise works"
