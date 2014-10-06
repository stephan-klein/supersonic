Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.app.statusBar"

  ###
   # @category core
   # @module app
   # @name statusBar
   # @overview
   # @description
   # The native status bar shown on the top of the screen. The native status bar is displayed by default. It can be hidden and shown application wide.
  ###
    
  ###
   # @module statusBar
   # @name hide
   # @function
   # @description
   # Hides the native status bar application wide.
   # @returns {Promise} Promise that is resolved when the status bar is hidden.
   # @usage
   # ```coffeescript
   # supersonic.app.statusBar.hide()
   # ```
  ###
  hide: bug "hide", ->
    new Promise (resolve, reject) ->
      steroids.statusBar.hide(
        {}
        {
          onSuccess: ->
            resolve()
          onFailure: ->
            reject()
        }
      )
  
  ###
   # @module statusBar
   # @name show
   # @function
   # @description
   # Shows the native status bar application wide. If no parameters are given, the status bar text color is the default color (black on iOS 7).
   # @param {string} style If set to "light" (shorthand), then the native status bar text color is light (white on iOS 7). Optional.
   # @param {Object} options Options object with `style` property (verbose). Optional.
   # @returns {Promise} Promise that is resolved when the status bar is shown.
   # @usage
   # ```coffeescript
   # supersonic.app.statusBar.show()
   # # Shorthand
   # supersonic.app.statusBar.show("light")
   # # Verbose
   # options =
   #  style: "light"
   # supersonic.app.statusBar.show(options)
   # ```
  ###
  show: bug "show", (options) ->
    style = if typeof options is "string"
      options
    else if options?.style?
      options.style
    else

    new Promise (resolve, reject) ->
      steroids.statusBar.show(
        {
          style: style
        }
        {
          onSuccess: ->
            resolve()
          onFailure: ->
            reject()
        }
      )
    
      