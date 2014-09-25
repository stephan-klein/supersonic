angular
  .module('ui')
  .controller 'NavigationBarController', ($scope, $q, supersonic) ->

    $scope.hide = ()->
      supersonic.ui.navigationBar.hide({ animated: true })
