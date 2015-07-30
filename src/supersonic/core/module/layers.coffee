Promise = require 'bluebird'
superify = require '../superify'

module.exports = (logger, steroids, router) ->
  s = superify 'supersonic.module.layers', logger

  push: s.promiseF 'push', (route, params = {}) ->

    path = router.getPath route, params

    new Promise (resolve, reject) ->
      view = new steroids.views.WebView
        location: path

      steroids.layers.push { view }, {
        onSuccess: resolve
        onFailure: (error) ->
          reject new Error error.errorDescription
      }

  pop: s.promiseF 'pop', ->
    new Promise (resolve, reject) ->
      steroids.layers.pop {}, {
        onSuccess: resolve
        onFailure: (error) ->
          reject new Error error.errorDescription
      }
