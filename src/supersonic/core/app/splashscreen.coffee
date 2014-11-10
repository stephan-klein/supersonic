Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.app.splashscreen', log

  ###
   # @namespace supersonic.app
   # @name splashscreen
   # @overview
   # @description
   # The splashscreen is shown in the application startup. The initial splashscreen is hidden automatically after 3 seconds on iOS and on the pageload event on Android. Allows the user to hide and show the splashscreen programmitically. The splashscreen is defined in your project's build configuration.
  ###

  ###
   # @namespace supersonic.app.splashscreen
   # @name show
   # @function
   # @apiCall supersonic.app.splashscreen.show
   # @description
   # Shows the splashscreen programmatically.
   # @type
   # supersonic.app.splashscreen.show: () =>
   #   Promise
   # @returnsDescription
   # [Promise](todo) that is resolved when the splashscreen is shown.
   # @usageCoffeeScript
   # supersonic.app.splashscreen.show()
   # @usageJavaScript
   # supersonic.app.splashscreen.show();
  ###
  show: s.promiseF "show", ->
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
   # @namespace supersonic.app.splashscreen
   # @name hide
   # @function
   # @apiCall supersonic.app.splashscreen.hide
   # @description
   # Hides the splashscreen programmatically.
   # @type
   # supersonic.app.splashscreen.hide: () =>
   #   Promise
   # @returnsDescription
   # [Promise](todo) that is resolved when the splashscreen is hidden.
   # @usageCoffeeScript
   # supersonic.app.splashscreen.hide()
   # @usageJavaScript
   # supersonic.app.splashscreen.hide();
  ###
  hide: s.promiseF "hide", ->
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
