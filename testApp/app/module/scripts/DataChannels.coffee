angular
  .module('module')
  .constant('ModuleDataChannel', supersonic.data.channel 'module-data-channel')
  .controller('DataChannelSendController', ($scope, ModuleDataChannel) ->
    $scope.sentMessages = 0
    $scope.send = ->
      ModuleDataChannel.publish (new Date).toString()
      $scope.sentMessages++

  )
  .controller('DataChannelReceiveController', ($scope, ModuleDataChannel) ->
    $scope.messages = []

    ModuleDataChannel.subscribe (message) ->
      $scope.$apply ->
        $scope.messages.unshift message
  )
