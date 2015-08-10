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
  modal:
    show: (route, params) ->
      new Promise (resolve, reject) ->
        path = router.getPath route, params

        view = new steroids.views.WebView
          location: path

        steroids.modal.show { view },
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription

    hide: ->
      new Promise (resolve, reject) ->
        steroids.modal.hide {}, {
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription
        }
