Bacon = require 'baconjs'
deepEqual = require 'deep-equal'
Promise = require 'bluebird'

# GLOBAL STATE JEEJEE!
channel = null
superscope = null
lastReceivedSuperScope = null

seemsLegit = (key, value) ->
  ((key.indexOf '$') isnt 0) and (key isnt 'this') and ('function' isnt typeof value)

superRootScopeProvider = ($rootScopeProvider) ->
  {
    $get: $rootScopeProvider.$get
  }

initChannel = ->
  channel ||= supersonic.data.channel '$superscope'

  channel.subscribe (freshSuperscope) ->
    fn = ->
      #TODO re-enable?
      # # If something was unset in fresh, unset it here
      # for own key, value of superscope when seemsLegit(key, value) and !freshSuperscope[key]?
      #   delete superscope[key]

      # Copy all the incoming values to superscope - they're guaranteed to be legit
      for key, value of freshSuperscope
        superscope[key] = value

      lastReceivedSuperScope = freshSuperscope

    if superscope.$root.$$phase == "$apply" || superscope.$root.$$phase == "$digest"
      fn()
    else
      superscope.$apply fn

  return channel

initSuperScope = (superRootScope)->
  channel ||= initChannel()
  superscope = superRootScope

  watchedValue = {}
  superscope.$watch ->
    values = {}
    for own key, value of superscope when seemsLegit(key, value)
      values[key] = value

    return if deepEqual(watchedValue, values)

    watchedValue = values

  , (newValue, oldValue)->
    return unless newValue? #WTF
    return if deepEqual(lastReceivedSuperScope, newValue)

    channel.publish(newValue)

  # Hide clear on the object
  clear = ->
    fn = ->
      for own key, value of superscope when seemsLegit(key, value)
        delete superscope[key]

    if superscope.$root.$$phase == "$apply" || superscope.$root.$$phase == "$digest"
      fn()
    else
      superscope.$apply fn

  Object.defineProperty superscope, 'clear', {
    enumerable: false
    get: -> clear
  }

  return superscope

superScopeService = (superRootScope) ->
  superscope or initSuperScope(superRootScope)

module.exports = (angular) ->
  angular
  .module 'supersonic.superscope', []
  .provider 'superRootScope', superRootScopeProvider
  .service 'superscope', superScopeService
