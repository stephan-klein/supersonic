Bacon = require 'baconjs'
deepEqual = require 'deep-equal'
Promise = require 'bluebird'

seemsLegit = (key, value) ->
  ((key.indexOf '$') isnt 0) and (key isnt 'this') and ('function' isnt typeof value)

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
          # Only try and send updates every N milliseconds
          .debounceImmediate(100)
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
        # Watch superscope on every digest loop iteration and feed the state to a bus
        superscopeUpdates.push superscope

      channel.subscribe (freshSuperscope) ->
        # If something was unset in fresh, unset it here
        for own key, value of superscope when seemsLegit(key, value) and !freshSuperscope[key]?
          delete superscope[key]

        # Copy all the incoming values to superscope - they're guaranteed to be legit
        for key, value of freshSuperscope
          superscope[key] = value

        superscope.$digest()

      # Hide clear on the object
      clear = ->
        for own key, value of superscope when seemsLegit(key, value)
          delete superscope[key]

        superscope.$digest()

      Object.defineProperty superscope, 'clear', {
        enumerable: false
        get: -> clear
      }

      superscope
    )
