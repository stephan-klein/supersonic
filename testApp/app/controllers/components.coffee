angular
  .module('componentsApp', ['supersonic'])
  .controller('IndexCtrl', ($scope, supersonic) ->
    
    $scope.navBarShown = true
    $scope.navBarTitle = ""


    $scope.showNavBar = ->
      $scope.navBarShown = true

    $scope.hideNavBar = ->
      $scope.navBarShown = false

    $scope.setNavBarTitle = ->
      $scope.navBarTitle = "HELLO WORLD!"

    $scope.removeNavBarTitle = ->
      $scope.navBarTitle = ""

  )
