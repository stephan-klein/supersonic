angular
  .module('indexApp', ['supersonic'])
  .controller 'IndexCtrl', ($scope, supersonic) ->

    steroids.view.navigationBar.show "Basic CSS components"

    $scope.open = (url)->
      steroids.layers.push
        view: new steroids.views.WebView url
        navigationBar: true
