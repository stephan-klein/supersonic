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
   # @apiCall supersonic.app.statusBar.hide
   # @description
   # Hides the statusBar application wide.
   # @type
   # supersonic.app.statusBar.hide: ()
   # => Promise
   # @returnsDescription
   # [Promise](todo) that is resolved when the statusBar is hidden.
   # @usageCoffeeScript
   # supersonic.app.statusBar.hide()
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
   # @apiCall supersonic.app.statusBar.show
   # @description
   # Shows the statusBar application wide.
   # @type
   # supersonic.app.statusBar.show: (style?: String)
   # => Promise
   # @define {String} style If set to "light" (shorthand), then the native status bar text color is light (white on iOS 7). Optional.
   # @returnsDescription
   # [Promise](todo) that is resolved when the statusBar is shown.
   # @usageCoffeeScript
   # supersonic.app.statusBar.show()
   # @exampleCoffeeScript
   # supersonic.app.statusBar.show("light").then ->
   #  supersonic.logger.log "Status bar shown"
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
