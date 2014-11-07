Bacon = require 'baconjs'
deepEqual = require 'deep-equal'

seemsLegit = (key, value) ->
  ((key.indexOf '$') isnt 0) and (key isnt 'this') and !('function' is typeof value)

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
      superscopeUpdates = new Bacon.Bus
      channel.outbound.plug do ->
        superscopeUpdates
          # Only try and send updates every 1000 milliseconds
          .debounceImmediate(1000)
          # Filter contents from superscope down to what seems legit
          .map((superscope) ->
            values = {}
            for own key, value of superscope when seemsLegit(key, value)
              values[key] = value
            values
          )
          # Don't send updates if nothing changed
          .skipDuplicates(deepEqual)

      superscope = superRootScope
      superscope.$watch ->
        console.log "Ding!"
        # Watch superscope on every digest loop iteration and feed the state to a bus
        superscopeUpdates.push superscope

      channel.subscribe (freshSuperscope) ->
        # If something was unset in fresh, unset it here
        for own key, value of superscope when seemsLegit(key, value) and !freshSuperscope[key]?
          delete superscope[key]

        # Copy all the incoming values to superscope - they're guaranteed to be legit
        for key, value of freshSuperscope
          superscope[key] = value

        supersonic.$digest()

      superscope.clear = ->
        for own key, value of superscope when seemsLegit(key, value)
          delete superscope[key]

        superscope.$digest()

      superscope
    )
