Promise = require 'bluebird'
superify = require '../superify'

module.exports = (logger, router, getDriver) ->
  s = superify 'supersonic.module.layers', logger

  push: s.promiseF 'push', (route, params = {}) ->
    path = router.getPath route, params
    Promise.resolve(getDriver().layers.push(path))

  pop: s.promiseF 'pop', ->
    Promise.resolve(getDriver().layers.pop())
