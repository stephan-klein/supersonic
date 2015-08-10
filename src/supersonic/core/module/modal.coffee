Promise = require 'bluebird'
superify = require '../superify'

module.exports = (logger, router, getDriver) ->
  s = superify 'supersonic.module.modal', logger

  show: s.promiseF 'show', (route, params = {}) ->
    params["disable_header"] = true unless params["disable_header"]?
    path = router.getPath route, params
    console.log("PATH FROM ROUTER TO MODAL SHOW: #{path}")
    Promise.resolve(getDriver().modal.show(path))

  pop: s.promiseF 'hide', ->
    Promise.resolve(getDriver().modal.hide())
