Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.app.splashscreen"

  ###
   # @category core
   # @module app
   # @name splashscreen
   # @overview
   # @description
   # The splashscreen is shown in the application startup. The initial splashscreen is hidden automatically after 3 seconds on iOS and on the pageload event on Android. Allows the user to hide and show the splashscreen programmitically. The splashscreen is defined in your project's build configuration.
  ###
  
  ###
   # @module splashscreen
   # @name show
   # @function
   # @apiCall supersonic.app.splashscreen.show
   # @description
   # Shows the splashscreen programmatically.
   # @type
   # supersonic.app.splashscreen.show: ()
   # => Promise
   # @returnsDescription
   # [Promise](todo) that is resolved when the splashscreen is shown.
   # @usageCoffeeScript
   # supersonic.app.splashscreen.show()
  ###
  show: bug "show", ->
    new Promise (resolve, reject) ->
      steroids.splashscreen.show(
        {}
        {
          onSuccess: ->
            resolve()
          onFailure: ->
            reject()
        }
      )
      
  ###
   # @module splashscreen
   # @name hide
   # @function
   # @apiCall supersonic.app.splashscreen.hide
   # @description
   # Hides the splashscreen programmatically.
   # @type
   # supersonic.app.splashscreen.hide: ()
   # => Promise
   # @returnsDescription
   # [Promise](todo) that is resolved when the splashscreen is hidden.
   # @usageCoffeeScript
   # supersonic.app.splashscreen.hide()
  ###
  hide: bug "hide", ->
    new Promise (resolve, reject) ->
      steroids.splashscreen.hide(
        {}
        {
          onSuccess: ->
            resolve()
          onFailure: ->
            reject()
        }
      )
