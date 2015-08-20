angular
  .module('module')
  .controller 'AttributeIframeController', ($scope) ->
    attributes = supersonic.module.attributes

    $scope.hasIframeAttribute = attributes.has('attribute-from-iframe')
    $scope.iframeAttributeValue = attributes.get('attribute-from-iframe')

    $scope.hasUrlParamAttribute = attributes.has('attribute-from-url-param')
    $scope.urlParamAttributeValue = attributes.get('attribute-from-url-param')

    $scope.hasParentUrlParamAttribute = attributes.has('attribute-from-parent-url-param')
    $scope.parentUrlParamAttributeValue = attributes.get('attribute-from-parent-url-param')

    $scope.hasAttributeFromNowhere = attributes.has('attribute-from-nowhere')
    $scope.attributeFromNowhereValue = attributes.get('attribute-from-nowhere', 'provided default value')
