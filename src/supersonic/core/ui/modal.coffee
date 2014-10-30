Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.modal"

  ###
   # @namespace supersonic.ui
   # @name modal
   # @overview
   # @description
   # Provides methods to work with layers
  ###

  ###
   # @namespace supersonic.ui.modal
   # @name show
   # @function
   # @description
   # Shows a view as a modal
   # @param {View} View object
   # @param {Object} [parameters]
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # view = supersonic.ui.view("app/modal.html")
   # supersonic.ui.modal.show(view, { disableAnimation: true })
   # ```
  ###
  show: (view, params = {})->
    new Promise (resolve, reject)->
      params.view = view._getWebView()
      steroids.modal.show params, {
        onSuccess: ()->
          supersonic.logger.info "Modal view was shown"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Showing a modal view has crashed with the error: #{error.errorDescription}"
          reject()
    }

  ###
   # @namespace supersonic.ui.modal
   # @name hide
   # @function
   # @description
   # Hides a modal view
   # @param {Object} [parameters]
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # view = supersonic.ui.view("app/modal.html")
   # supersonic.ui.modal.show(view, { disableAnimation: true }).then ()->
   #   supersonic.ui.modal.hide()
   # ```
  ###
  hide: (params = {})->
    new Promise (resolve, reject)->
      # debugger
      steroids.modal.hide params, {
        onSuccess: ()->
          supersonic.logger.info "Modal view was hidden"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Hiding a modal view has crashed with the error: #{error.errorDescription}"
          reject()
    }

  ###
   # @namespace supersonic.ui.modal
   # @name hideAll
   # @function
   # @description
   # Hides a modal view
   # @param {Object} [parameters]
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # view = supersonic.ui.view("app/modal.html")
   # supersonic.ui.modal.show(view, { disableAnimation: true }).then ()->
   #   supersonic.ui.modal.hideAll()
   # ```
  ###
  hideAll: (params = {})->
    new Promise (resolve, reject)->
      # debugger
      steroids.modal.hideAll params, {
        onSuccess: ()->
          supersonic.logger.info "All the modals were hidden"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Hiding all the modals has crashed with the error: #{error.errorDescription}"
          reject()
    }
