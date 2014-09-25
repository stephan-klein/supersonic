Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.navigationBar"

  ###*
   * @ngdoc overview
   * @name navigationBar
   * @module ui
   * @description
   * Provides methods to work with layers
  ###

  hide: (params = {})->
    steroids.view.navigationBar.hide params, {
      onSuccess: ()->
        supersonic.logger.info "Navigation bar was hidden"
      onFailure: (error)->
        supersonic.logger.error "Hiding a navigation bar crashed due to the error: #{error.errorDescription}"
    }
