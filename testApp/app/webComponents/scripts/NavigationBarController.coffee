angular
  .module('webComponents')
  .controller 'NavigationBarController', ($scope) ->
    $scope.showNav = ->
      document.querySelector('ss-navigation-bar').setAttribute("style", "display: block;")

    $scope.hideNave = ->
      document.querySelector('ss-navigation-bar').setAttribute("style", "display: none;")
