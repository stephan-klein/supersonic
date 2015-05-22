angular
  .module('module')
  .controller 'IndexController', ($scope) ->
    supersonic.module.initialModuleElements.then(
      (elements) ->
        $scope.moduleElements = elements

        $scope.$apply()
    )
