angular
  .module('ui')
  .controller 'IndexController', ($scope, $q, supersonic) ->

    $scope.navigateTo = (url)->
      v = supersonic.ui.view(url, "myView")
      supersonic.ui.layer.push(v)

    $scope.asDrawer = (url)->
      v = supersonic.ui.view(url)

      webView = v.getWebView()

      v.preload().then ()->
        supersonic.ui.drawer.asLeft(v)
