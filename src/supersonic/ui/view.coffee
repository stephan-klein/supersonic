Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.view"

  ###*
   * @category core
   * @module ui
   * @name view
   * @overview
   * @description
   * Allows to create new View instances
  ###

  class View

    ###*
     * @module ui
     * @name view
     * @constructor
     * @description
     * Creates a new view
     * @param {string} URL of a view
     * @returns {Object} The created view object.
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

    _checkIfPreloaded: ()->
      that = @
      new Promise (resolve, reject) ->
        steroids.getApplicationState {}, {
          onSuccess: (state)->
            loaded = false
            state.preloads.forEach (p)->
              loaded = loaded || (p.id.indexOf(that.location) != -1)

            if !loaded
              resolve(false)
            else
              resolve(true)

          onFailure: ()->
            supersonic.logger.error "Somethig went wrong with checking the applicaiton state"
            reject()
        }

    # TODO: Maybe preloads whould happen in contructor by default?

    ###*
     * @ngdoc method
     * @name preload
     * @module view
     * @description
     * Preloads a new
     * @returns {Promise} A promise that will be resolved once the view has been preloaded.
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
        that._checkIfPreloaded().then (isPreloaded)->
          if isPreloaded
            supersonic.logger.info "View was already preloaded"
            resolve()
          else
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
     * @module view
     * @name setWidth
     * @function
     * @description
     * Sets width of a view. Useful for showing as a drawer
     * @returns {Object} View object
     * @usage
     * ```coffeescript
     * view = supersonic.ui.view("http://www.google.com").setWidth(200)
     * ```
    ###
    setWidth: (width)->
      @getWebView().widthOfDrawerInPixels = width
      return @

    ###*
     * @module view
     * @name getView
     * @function
     * @description
     * Gets the WebView of a current view instance
     * @returns {Object} WebView object
     * @usage
     * ```coffeescript
     * supersonic.ui.view("http://www.google.com").getView()
     * ```
    ###
    getWebView: ()->
      return @_webView

  return (location, id)->
    return new View(location, id)
