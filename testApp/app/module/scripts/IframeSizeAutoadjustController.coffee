angular
  .module('module')
  .controller 'IframeSizeAutoadjustController', ($scope) ->
    supersonic.module.initialModuleElements.then(
      (elements) ->
        $scope.moduleElements = elements

        $scope.$apply()
    )
