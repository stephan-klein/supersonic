Promise = require 'bluebird'
superify = require '../superify'

module.exports = (logger, router, getDriver, global) ->
  s = superify 'supersonic.module.modal', logger

  show: s.promiseF 'show', (route, params = {}) ->
    params["disable_header"] = true unless params["disable_header"]?

    path = router.getPath route, params
    Promise.resolve(getDriver().modal.show(path, {
      route
      params
      context: global
    }))

  hide: s.promiseF 'hide', ->
    Promise.resolve getDriver().modal.hide {
      context: global
    }
