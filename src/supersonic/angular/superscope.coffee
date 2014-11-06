module.exports = (angular) ->
  angular
    .module('supersonic.superscope', [])
    .provider('superscope', ($rootScopeProvider) ->
      {
        $get: $rootScopeProvider.$get
      }
    )