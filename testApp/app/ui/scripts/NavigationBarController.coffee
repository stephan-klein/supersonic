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

    $scope.update = ()->
      leftButton = new supersonic.ui.navigationButton({
        title: "Left"
        onTap: ()->
          alert "left"
      })
      rightButton = new supersonic.ui.navigationButton({
        title: "Right"
        onTap: ()->
          alert "right"
      })

      supersonic.ui.navigationBar.update({
        overrideBackButton: true,
        buttons: {
          left: [leftButton]
          right: [rightButton]
        }
      }).then ()->
        supersonic.logger.log "promise works"

    $scope.update2 = ()->
      leftButton = new supersonic.ui.navigationButton({
        title: "New"
        onTap: ()->
          alert "New left"
      })
      
      supersonic.ui.navigationBar.update({
        overrideBackButton: true,
        buttons: {
          left: [leftButton]
        }
      }).then ()->
        supersonic.logger.log "promise works"
