Promise = require 'bluebird'
superify = require '../superify'

module.exports = (logger, router, getDriver) ->
  s = superify 'supersonic.module.layers', logger

  push: s.promiseF 'push', (route, params = {}) ->
    Promise.resolve(getDriver().layers.push(route, params))

  pop: s.promiseF 'pop', ->
    Promise.resolve(getDriver().layers.pop())
