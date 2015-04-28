angular
  .module('env')
  .controller 'EnvController', ($scope, supersonic) ->
    $scope.items = supersonic.env
