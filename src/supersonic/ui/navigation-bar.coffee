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

  ###*
   * @ngdoc method
   * @name show
   * @module navigationBar
   * @description
   * Shows a navigation bar
   * @param {Object} [parameters] Parameters of hiding
   * @returns {Promise}
   * @usage
   * ```coffeescript
   * supersonic.ui.navigationBar.show({ animated: true, title: "New Title" }).then ()->
   *   supersonic.logger.log "promise works"
   * ```
  ###
  show: (params = {})->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.show params, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar was shown"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Showing the navigation bar crashed due to the error: #{error.errorDescription}"
          reject()
      }

  ###*
   * @ngdoc method
   * @name hide
   * @module navigationBar
   * @description
   * Hides a navigation bar
   * @param {Object} [parameters] Parameters of hiding
   * @returns {Promise}
   * @usage
   * ```coffeescript
   * supersonic.ui.navigationBar.hide({ animated: true }).then ()->
   *   supersonic.logger.log "promise works"
   * ```
  ###
  hide: (params = {})->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.hide params, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar was hidden"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Hiding the navigation bar crashed due to the error: #{error.errorDescription}"
          reject()
      }
