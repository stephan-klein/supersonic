Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.drawer"

  ###*
   * @ngdoc overview
   * @name drawer
   * @module ui
   * @description
   * Module of methods to work with drawers
  ###

  ###*
   * @ngdoc method
   * @name asLeft
   * @module drawer
   * @description
   * Shows a view as a left drawer
   * @param {View} View object
   * @returns
   * @usage
   * ```coffeescript
   * view = supersonic.ui.view("app/drawers/left.html")
   * supersonic.ui.drawer.asLeft(view)
   * ```
  ###
  asLeft: (view)->
    @show(view, 'left')
    return

  ###*
   * @ngdoc method
   * @name asRight
   * @module drawer
   * @description
   * Shows a view as a right drawer
   * @param {View} View object
   * @returns
   * @usage
   * ```coffeescript
   * view = supersonic.ui.view("app/drawers/right.html")
   * supersonic.ui.drawer.asRight(view)
   * ```
  ###
  asRight: (view)->
    @show(view, 'right')
    return

  ###*
   * @ngdoc method
   * @name show
   * @module drawer
   * @description
   * Shows a view as a drawer of the given side
   * @param {View} View object
   * @param {String} Side to show a drawer: "left" or "right"
   * @returns
   * @usage
   * ```coffeescript
   * view = supersonic.ui.view("app/drawers/index.html")
   * supersonic.ui.drawer.show(view, "left")
   * ```
  ###
  show: (view, side)->
    # TODO: Promises
    webView = view.getWebView()
    params = {}
    params[side] = webView
    steroids.drawers.update params
    steroids.drawers.show {
      edge: steroids.screen.edges[side.toUpperCase()]
    }, {
      onSuccess: ()->
        supersonic.logger.log "#{side} drawer should be shown"
      onFailure: ()->
        supersonic.logger.log "#{side} drawer fails"
    }
    return

  ###*
   * @ngdoc method
   * @name setOptions
   * @module drawer
   * @description
   * Sets options for drawers
   * @param {Object} Hash of parameters
   * @returns
   * @usage
   * ```coffeescript
   * supersonic.ui.drawer.setOptions {
   *   showShadow: true
   *   animation: steroids.drawers.defaultAnimations.PARALLAX
   * }
   * ```
  ###
  setOptions: (options)->
    steroids.drawers.update {
      options: options
    }
