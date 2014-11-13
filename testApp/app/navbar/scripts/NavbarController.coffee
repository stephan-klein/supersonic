angular
  .module('navbar')
  .controller 'NavbarController', ($scope) ->

    $scope.showNavbar = ->
      document.querySelector('super-navbar').setAttribute("style", "display: block;")

    $scope.hideNavbar = ->
      document.querySelector('super-navbar').setAttribute("style", "display: none;")

    $scope.navbarTitle = "Title"

    $scope.setNavbarTitle = ->
      $scope.navbarTitle = "New title"

    $scope.removeNavbarTitle = ->
      $scope.navBarTitle = undefined

    $scope.navbarButtonCallback = (msg) ->
      supersonic.ui.dialog.alert """I'm \"#{msg}\""""