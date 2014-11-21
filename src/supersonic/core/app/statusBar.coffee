Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.app.statusBar', log
  ###
   # @namespace supersonic.app
   # @name statusBar
   # @overview
   # @description
   # The native status bar shown on the top of the screen, showing network strength, battery percentage etc. All changes to the status bar take effect app-wide. You can determine the initial visibility of the status bar in the `config/app.coffee` file.
  ###

  ###
   # @namespace supersonic.app.statusBar
   # @name hide
   # @function
   # @apiCall supersonic.app.statusBar.hide
   # @description
   # Hides the status bar application wide.
   # @type
   # supersonic.app.statusBar.hide: () =>
   #   Promise
   # @returnsDescription
   # A promise that is resolved when the status bar is hidden.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.app.statusBar.hide()
   # @exampleJavaScript
   # supersonic.app.statusBar.hide();
  ###
  hide: s.promiseF "hide", ->
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
   # @namespace supersonic.app.statusBar
   # @name show
   # @function
   # @apiCall supersonic.app.statusBar.show
   # @description
   # Shows the statusBar application wide.
   # @type
   # supersonic.app.statusBar.show: (style?: String) =>
   #   Promise
   # @define {String} style="default" **iOS-only.** Used to determine text color in the status bar (the status bar background color is the same as the native navigation bar background color). Valid values are:
   # <ul>
   #   <li>`"default"`: Show black text in status bar.</li>
   #   <li>`"light"`: Show white text in status bar.</li>
   # </ul>
   # @returnsDescription
   # A promise that is resolved when the status bar is shown.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.app.statusBar.show("light").then ->
   #   supersonic.logger.log "Status bar shown"
   # @exampleJavaScript
   # supersonic.app.statuSBar.show("light").then(function(){
   #   supersonic.logger.log("Status bar shown");
   # });
  ###
  show: s.promiseF "show", (options) ->
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
