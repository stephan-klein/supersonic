Promise = require 'bluebird'


module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.ui.drawer"

  ###
   # @category core
   # @module ui
   # @name drawer
   # @overview
   # @description Module of methods to work with drawers
  ###

  ###
   # @module drawer
   # @name asLeft
   # @function
   # @description
   # Shows a view as a left drawer
   # @param {View} View object
   # @returns {Promise} A promise that will be resolved once the drawer has been shown.
   # @usage
   # ```coffeescript
   # view = supersonic.ui.view("app/drawers/left.html")
   # supersonic.ui.drawer.asLeft(view)
   # ```
  ###
  asLeft: (view)->
    that = @
    new Promise (resolve, reject)->
      that.show(view, 'left').then ()->
        resolve()

  ###
   # @module drawer
   # @name asRight
   # @function
   # @description
   # Shows a view as a right drawer
   # @param {View} View object
   # @returns {Promise} A promise that will be resolved once the drawer has been shown.
   # @usage
   # ```coffeescript
   # view = supersonic.ui.view("app/drawers/right.html")
   # supersonic.ui.drawer.asRight(view)
   # ```
  ###
  asRight: (view)->
    that = @
    new Promise (resolve, reject)->
      that.show(view, 'right').then ()->
        resolve()

  ###
   # @module drawer
   # @name show
   # @function
   # @description
   # Shows a view as a drawer of the given side
   # @param {View} View object
   # @param {String} Side to show a drawer: "left" or "right"
   # @returns {Promise} A promise that will be resolved once the drawer has been shown.
   # @usage
   # ```coffeescript
   # view = supersonic.ui.view("app/drawers/index.html")
   # supersonic.ui.drawer.show(view, "left")
   # ```
  ###
  show: (view, side)->
    new Promise (resolve, reject)->
      webView = view._getWebView()
      params = {}
      params[side] = webView
      steroids.drawers.update params
      steroids.drawers.show {
        edge: steroids.screen.edges[side.toUpperCase()]
      }, {
        onSuccess: ()->
          supersonic.logger.info "#{side} drawer should be shown"
          resolve()
        onFailure: ()->
          supersonic.logger.error "#{side} drawer fails"
          reject()
      }

  # TODO: Finish the method
  hide: ()->
    new Promise (resolve, reject)->
      steroids.drawers.hide {
      }, {
        onSuccess: ()->
          supersonic.logger.info "Drawer was hidden"
          resolve()
        onFailure: ()->
          supersonic.logger.error "Hiding a drawer crached"
          reject()
      }

  ###
   # @module drawer
   # @name setOptions
   # @function
   # @description
   # Sets options for drawers
   # @param {Object} Hash of parameters
   # @usage
   # ```coffeescript
   # supersonic.ui.drawer.setOptions
   #   showShadow: true
   #   animation: steroids.drawers.defaultAnimations.PARALLAX
   # ```
  ###
  setOptions: (options)->
    steroids.drawers.update {
      options: options
    }
