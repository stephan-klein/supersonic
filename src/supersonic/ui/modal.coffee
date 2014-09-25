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
