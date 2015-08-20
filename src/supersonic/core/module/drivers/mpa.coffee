Promise = require 'bluebird'

module.exports = (steroids) ->
  layers:
    push: (path, args) ->
      new Promise (resolve, reject) ->
        view = new steroids.views.WebView
          location: path

        steroids.layers.push { view }, {
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription
        }

    pop: (args) ->
      new Promise (resolve, reject) ->
        steroids.layers.pop {}, {
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription
        }
  modal:
    show: (path, args) ->
      new Promise (resolve, reject) ->
        view = new steroids.views.WebView
          location: path

        steroids.modal.show { view },
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription

    hide: (args) ->
      new Promise (resolve, reject) ->
        steroids.modal.hide {}, {
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription
        }
