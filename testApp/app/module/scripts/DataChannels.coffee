angular
  .module('module')
  .constant('ModuleDataChannel', supersonic.data.channel 'module-data-channel')
  .controller('DataChannelController', ($scope, ModuleDataChannel) ->
    $scope.sent = 0
    $scope.received = 0
    $scope.total = 0

    ModuleDataChannel.subscribe ->
      $scope.$apply ->
        $scope.received++
        $scope.total++

    $scope.send = ->
      ModuleDataChannel.publish (new Date).toString()
      $scope.sent++
      $scope.total++

  )
