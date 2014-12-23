angular
  .module('device')
  .controller 'PushController', ($scope, $timeout, supersonic) ->
    $scope.registration = 'nothing yet'
    $scope.register = ->
      supersonic.device.push.register(
        senderID: "118177668912"
      ).then (registration) ->
        $scope.registration = registration

    $scope.unregister = ->
      supersonic.device.push.unregister().then ->
        $scope.registration = 'removed'

    $scope.foregroundNotifications = null
    $scope.watchForegroundNotifications = ->
      $scope.foregroundNotifications = []
      supersonic.device.push.foregroundNotifications().onValue (notification) ->
        $scope.$apply ->
          $scope.foregroundNotifications.push (notification.message || notification.alert)

    $scope.backgroundNotifications = null
    $scope.watchBackgroundNotifications = ->
      $scope.backgroundNotifications = []
      supersonic.device.push.backgroundNotifications().onValue (notification) ->
        $scope.$apply ->
          $scope.backgroundNotifications.push (notification.message || notification.alert)
