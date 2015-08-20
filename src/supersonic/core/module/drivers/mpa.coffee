Promise = require 'bluebird'

module.exports = (steroids) ->
  layers:

    ###
     # @namespace supersonic.module.drivers.mpa
     # @name layers.push
     # @function
     # @type
     # supersonic.module.drivers.mpa.layers.push: (
     #   path: String
     #   context: {
     #     route: String
     #     params: Object
     #     origin: Window
     #   }
     # )
     # @define {String} path Which view should be pushed according to the router
     # @define {String} route The original route string
     # @define {Object} params The parameters reflected in the path
     # @define {Window} origin From which Window did the navigation event originate
    ###
    push: (path, context) ->
      new Promise (resolve, reject) ->
        view = new steroids.views.WebView
          location: path

        steroids.layers.push { view }, {
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription
        }

    ###
     # @namespace supersonic.module.drivers.mpa
     # @name layers.pop
     # @function
     # @type
     # supersonic.module.drivers.mpa.layers.pop: (
     #   context: {
     #     origin: Window
     #   }
     # )
     # @define {Window} origin From which Window did the navigation event originate
    ###
    pop: (context) ->
      new Promise (resolve, reject) ->
        steroids.layers.pop {}, {
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription
        }

  modal:

    ###
     # @namespace supersonic.module.drivers.mpa
     # @name modal.show
     # @function
     # @type
     # supersonic.module.drivers.mpa.modal.show: (
     #   path: String
     #   context: {
     #     route: String
     #     params: Object
     #     origin: Window
     #   }
     # )
     # @define {String} path Which view should be shown according to the router
     # @define {String} route The original route string
     # @define {Object} params The parameters reflected in the path
     # @define {Window} origin From which Window did the navigation event originate
    ###
    show: (path, context) ->
      new Promise (resolve, reject) ->
        view = new steroids.views.WebView
          location: path

        steroids.modal.show { view },
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription

    ###
     # @namespace supersonic.module.drivers.mpa
     # @name modal.hide
     # @function
     # @type
     # supersonic.module.drivers.mpa.modal.hide: (
     #   context: {
     #     origin: Window
     #   }
     # )
     # @define {Window} origin From which Window did the navigation event originate
    ###
    hide: (context) ->
      new Promise (resolve, reject) ->
        steroids.modal.hide {}, {
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorDescription
        }
