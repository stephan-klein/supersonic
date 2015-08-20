Promise = require 'bluebird'
superify = require '../superify'

module.exports = (logger, router, getDriver, global) ->
  s = superify 'supersonic.module.layers', logger

  ###
   # @namespace supersonic.module.layers
   # @name push
   # @function
   # @type
   # supersonic.module.layers.push: (
   #   route: String
   #   attributes: Object
   # ) => Promise
   # @define {String} route The navigation target
   # @define {Object} attributes What attributes to pass to the target
  ###
  push: s.promiseF 'push', (route, attributes = {}) ->
    path = router.getPath route, attributes
    Promise.resolve(getDriver().layers.push(path, {
      route
      attributes
      origin: global
    }))

  ###
   # @namespace supersonic.module.layers
   # @name pop
   # @function
   # @type
   # supersonic.module.layers.pop: () => Promise
  ###
  pop: s.promiseF 'pop', ->
    Promise.resolve(getDriver().layers.pop({
      origin: global
    }))
