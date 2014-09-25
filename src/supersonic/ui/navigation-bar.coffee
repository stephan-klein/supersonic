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
    new Promise (resolve, reject)->
      steroids.view.navigationBar.hide params, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar was hidden"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Hiding a navigation bar crashed due to the error: #{error.errorDescription}"
          reject()
      }
