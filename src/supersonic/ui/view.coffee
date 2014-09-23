Promise = require 'bluebird'

module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.app"

  view = {
    ###*
     * @ngdoc method
     * @name create
     * @module views
     * @description
     * Creates a new view
     * @param {string} URL of a view
     * @returns {Promise} Promise that is resolved when the application is resumed.
     * @usage
     * ```coffeescript
     * supersonic.ui.view.create("http://www.google.com")
     * ```
    ###
    create: ()->
      supersonic.logger.log "to create a view"
  }

  return view
