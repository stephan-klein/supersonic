Promise = require 'bluebird'

module.exports = (steroids, router) ->
  layers:
    push: (route, params) ->
      new Promise (resolve, reject) ->
        path = router.getPath route, params

        view = new steroids.views.WebView
          location: path

        steroids.layers.push { view }, {
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription
        }

    pop: ->
      new Promise (resolve, reject) ->
        steroids.layers.pop {}, {
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription
        }
