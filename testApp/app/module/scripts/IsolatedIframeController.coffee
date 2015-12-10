angular
  .module('module')
  .controller 'IsolatedIframeController', ($scope) ->
    attributes = supersonic.module.attributes

    $scope.hasAttributeFromTopFrame = attributes.has('isolated-iframe-should-not-get-access-to-this')
    $scope.attributeFromTopFrame = attributes.get('isolated-iframe-should-not-get-access-to-this')

    $scope.hasAttributeFromIsolatedParentFrame = attributes.has('isolated-scope-should-see-this')
    $scope.attributeFromIsolatedParentFrame = attributes.get('isolated-scope-should-see-this')
