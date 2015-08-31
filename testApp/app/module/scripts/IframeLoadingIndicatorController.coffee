angular
  .module('module')
  .controller 'IframeLoadingIndicatorController', ($scope) ->
    $scope.showLoading = ->
      for iframe in supersonic.module.iframes.findAll()
        supersonic.module.iframes.showLoadIndicator(iframe)

    $scope.hideLoading = ->
      for iframe in supersonic.module.iframes.findAll()
        supersonic.module.iframes.hideLoadIndicator(iframe)
