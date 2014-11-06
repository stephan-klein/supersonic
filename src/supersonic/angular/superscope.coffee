module.exports = (angular) ->
  angular
    .module('supersonic.superscope', [])
    .provider('superRootScope', ($rootScopeProvider) ->
      {
        $get: $rootScopeProvider.$get
      }
    )
    .service('superscope', (superRootScope) ->
      channel = supersonic.data.channel '$superscope'
      
      superscope = superRootScope
      superscope.$watch ->
        # Assume everything changes at every digest
        changed = {}
        for key, value of superscope when ((key.indexOf '$') isnt 0) and (key isnt 'this')
          changed[key] = value
          console.log {key, value}
        console.log changed
        # Notify other views of changes
        channel.publish null

      channel.subscribe (freshSuperscope) ->
        superscope.$apply ->
          for key, value of superscope when !freshSuperscope[key]?
            delete superscope[key]

          for key, value of freshSuperscope
            superscope[key] = value

      superscope
    )
