Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.modal"

  ###*
   * @ngdoc overview
   * @name modal
   * @module ui
   * @description
   * Provides methods to work with layers
  ###

  ###*
   * @ngdoc method
   * @name show
   * @module modal
   * @description
   * Shows a view as a modal
   * @param {View} View object
   * @param {Object} [parameters]
   * @returns {Promise}
   * @usage
   * ```coffeescript
   * view = supersonic.ui.view("app/modal.html")
   * supersonic.ui.modal.show(view, { disableAnimation: true })
   * ```
  ###
  show: (view, params = {})->
    new Promise (resolve, reject)->
      params.view = view.getWebView()
      steroids.modal.show params, {
        onSuccess: ()->
          supersonic.logger.info "Modal view was shown"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Showing a modal view was crashed with the error: #{error.errorDescription}"
          reject()
    }


  ###*
   * @ngdoc method
   * @name hide
   * @module modal
   * @description
   * Hides a modal view
   * @param {Object} [parameters]
   * @returns {Promise}
   * @usage
   * ```coffeescript
   * view = supersonic.ui.view("app/modal.html")
   * supersonic.ui.modal.show(view, { disableAnimation: true }).then ()->
   *   supersonic.ui.modal.hide()
   * ```
  ###
  hide: (params = {})->
    new Promise (resolve, reject)->
      # debugger
      steroids.modal.hide params, {
        onSuccess: ()->
          supersonic.logger.info "Modal view was hidden"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Hiding a modal view was crashed with the error: #{error.errorDescription}"
          reject()
    }
