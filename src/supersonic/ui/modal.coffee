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

  show: (view, params)->    
    params.view = view.getWebView()
    steroids.modal.show params, {
      onSuccess: ()->
        supersonic.logger.log "Was shown"
    }
