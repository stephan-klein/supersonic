angular
  .module('ui')
  .controller 'NavigationBarController', ($scope, $q, supersonic) ->

    supersonic.ui.navigationBar.getButtonById("editButton").then (button)->
      if button?
        # this uses steroids.navigationBar.getNativeState internally to see if current view has a button with given id, fails if it doesn't
        button.addEventListener "tap", ->
          # this starts listening on UI events chanenl for nav bar button with id "test"
          # since is sync, fails silently if the id doesn't match a button
          alert "Edit Button Tapped"

    $scope.pushWithNavbar = ()->
      newView = new supersonic.ui.View
        location:"/app/ui/nav-bar-push.html"
        navigationBar:
          title: "Pre Config!"
          buttons:
            right: [
              {
                id:"editButton"
                title:"Edit"
              }
            ]

      supersonic.ui.layers.push(newView).then ->
        supersonic.logger.log "new WebView with navbar pushed"

    $scope.hide = ()->
      supersonic.ui.navigationBar.hide({ animated: true }).then ()->
        supersonic.logger.log "Nav bar hidden"

    $scope.hideWithCallback = ()->
      supersonic.ui.navigationBar.hide
        onSuccess: ->
          supersonic.logger.log "Nav bar hidden with callback"
        onFailure: ->
          supersonic.logger.log "Could not hide the nav bar"

    $scope.show = ()->
      supersonic.ui.navigationBar.show().then ()->
        supersonic.logger.log "Nav bar shown"

    $scope.show2 = ()->
      supersonic.ui.navigationBar.show({animated: true}).then ()->
        supersonic.logger.log "Nav bar shown with an animation."

    $scope.showWithCallback = ()->
      supersonic.ui.navigationBar.show
        onSuccess: ->
          supersonic.logger.log "Nav bar shown with callback"
        onFailure: ->
          supersonic.logger.log "Could not show the nav bar"

    $scope.update = ()->
      leftButton = new supersonic.ui.NavigationBarButton({
        title: "Left"
        onTap: ()->
          supersonic.ui.dialog.alert "left"
      })
      rightButton = new supersonic.ui.NavigationBarButton({
        title: "Right"
        onTap: ()->
          supersonic.ui.dialog.alert "right"
      })

      supersonic.ui.navigationBar.update({
        title: "New Title"
        overrideBackButton: true
        buttons: {
          left: [leftButton]
          right: [rightButton]
        }
      }).then ()->
        supersonic.logger.log "Nav bar title and buttons updated."

    $scope.update2 = ()->
      leftButton = new supersonic.ui.NavigationBarButton({
        title: "New"
        onTap: ()->
          supersonic.ui.dialog.alert "New left"
      })

      supersonic.ui.navigationBar.update({
        overrideBackButton: false
        buttons: {
          left: [leftButton]
        }
      }).then ()->
        supersonic.logger.log "Nav bar left buttons updated."

    $scope.updateWithCallback = ()->
      supersonic.ui.navigationBar.update {title: "Title"},
        onSuccess: ->
          supersonic.logger.log "Nav bar updated with callback"
        onFailure: ->
          supersonic.logger.log "Could not update the nav bar"
