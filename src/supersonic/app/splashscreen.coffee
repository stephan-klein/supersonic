Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.app.splashscreen"

  ###*
   * @category core
   * @overview
   * @name splashscreen
   * @module app
   * @description
   * The splashscreen is shown in the application startup. The initial splashscreen is hidden automatically after 3 seconds on iOS and on the pageload event on Android. Allows the user to hide and show the splashscreen programmitically. The splashscreen is defined in your project's build configuration.
  ###
  

  ###*
   * @ngdoc method
   * @name show
   * @module splashscreen
   * @description
   * Shows the splashscreen programmatically.
   * @returns {Promise} Promise that is resolved when the splashscreen is shown.
   * @usage
   * ```coffeescript
   * supersonic.app.splashscreen.show()
   * ```
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
      
  ###*
   * @ngdoc method
   * @name hide
   * @module splashscreen
   * @description
   * Hides the splashscreen programmatically.
   * @returns {Promise} Promise that is resolved when the splashscreen is hidden.
   * @usage
   * ```coffeescript
   * supersonic.app.splashscreen.hide()
   * ```
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
