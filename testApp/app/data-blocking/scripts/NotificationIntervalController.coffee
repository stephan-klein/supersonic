Bacon = supersonic.internal.Bacon

angular.module('data-blocking').controller('NotificationIntervalController', ($scope) ->
  $scope.interval = 1
  $scope.notification = null

  NotificationModel = supersonic.data.model 'AppGyverNotification'

  interval = Bacon.fromBinder (sink) ->
    $scope.$watch 'interval', (interval) ->
      sink Number interval

  interval
    .flatMapLatest (seconds) ->
      if seconds < 1
        Bacon.never()
      else
        Bacon.interval(seconds * 1000, true).startWith(true)
    .debounce(500)
    .flatMapFirst ->
      $scope.$apply ->
        $scope.notification = null
      Bacon.fromPromise NotificationModel.create {
        created_at: (new Date).toJSON()
        type: 'supersonic.test-app.data-blocking'
        message: 'interval triggered'
      }
    .onValue (notification) ->
      $scope.$apply ->
        $scope.notification = notification
)
