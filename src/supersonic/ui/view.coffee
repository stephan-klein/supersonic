Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.view"

  ###*
   * @ngdoc overview
   * @name view
   * @module ui
   * @description
   * Allows to create new View instances
  ###

  class View

    ###*
     * @ngdoc method
     * @name view
     * @module ui
     * @description
     * Creates a new view
     * @param {string} URL of a view
     * @returns View object
     * @usage
     * ```coffeescript
     * supersonic.ui.view("http://www.google.com")
     * ```
    ###
    constructor: (location, id) ->
      # if this !instanceof View
      #   return new View(location, id)

      @location = location
      # @id = id || location

      supersonic.logger.info "'#{@location}' view was created"

      @_webView = new steroids.views.WebView {
        location: @location,
        id: @id
      }

    # TODO: Maybe preloads whould happen in contructor by default?

    ###*
     * @ngdoc method
     * @name preload
     * @module view
     * @description
     * Preloads a new
     * @param
     * @returns {Promise}
     * @usage
     * ```coffeescript
     * supersonic.ui.view("http://www.google.com").preload()
     *
     * v = supersonic.ui.view("http://www.google.com")
     * v.preload()
     * ```
    ###
    preload: () ->
      that = @
      new Promise (resolve, reject) ->
        params = {}
        if that.id
          params.id = that.id
        that._webView.preload( params, {

          onSuccess: ()->
            supersonic.logger.info "View was preloaded"
            resolve()

          onFailure: ()->
            supersonic.logger.error "Preloading was failed"
            reject()
        })

    ###*
     * @ngdoc method
     * @name getView
     * @module view
     * @description
     * Gets the webView of a current instance
     * @param
     * @returns {Object} webView object
     * @usage
     * ```coffeescript
     * supersonic.ui.view("http://www.google.com").getView()
     * ```
    ###
    getWebView: ()->
      return @_webView

  return (location, id)->
    return new View(location, id)
