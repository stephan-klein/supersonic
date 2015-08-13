Promise = require 'bluebird'
superify = require '../superify'

module.exports = (logger, router, getDriver) ->
  s = superify 'supersonic.module.modal', logger

  show: s.promiseF 'show', (route, params = {}) ->
    params["disable_header"] = true unless params["disable_header"]?
    Promise.resolve(getDriver().modal.show(route, params))

  hide: s.promiseF 'hide', ->
    Promise.resolve getDriver().modal.hide()
