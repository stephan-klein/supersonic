Promise = require 'bluebird'

module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.app"

  class ViewClass

    constructor: (@location, @id) ->
      if !@id
        @id = @location


      @_view = new steroids.views.WebView {
        location: @location,
        id: @id
      }

    viewMethod: () ->
      supersonic.logger.log "View method is called"

  view = {
    ###*
     * @ngdoc method
     * @name create
     * @module views
     * @description
     * Creates a new view
     * @param {string} URL of a view
     * @returns View object
     * @usage
     * ```coffeescript
     * supersonic.ui.view.create("http://www.google.com")
     * ```
    ###
    create: (location, id)->

      return new ViewClass(location, id)

  }

  return view
