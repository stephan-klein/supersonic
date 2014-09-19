Promise = require 'bluebird'
logger = require '../core/logger'

module.exports = (steroids) ->
  log = logger steroids

  ###*
   * @ngdoc method
   * @name openURL
   * @module app
   * @description
   * Launches browser to open the URL or any external application with that applications URL scheme.
   * @param {string} URL to open. URLs starting with "http(s)://" will be opened in the device's browser.
   * @returns {Promise} Promise that is resolved when the application is resumed.
   * @usage
   * ```coffeescript
   * supersonic.app.openURL("http://www.google.com")
   * supersonic.app.openURL("otherapp://?foo=1&bar=2")
   * ```
  ###
  openURL = (url) ->
    log.debug "supersonic.app.openURL called"
    new Promise (resolve, reject) ->
      successCallback = ->
        document.addEventListener "resume", ->
          log.debug "supersonic.app.openURL opened URL, the app is resumed"
          resolve()

      steroids.openURL(
        { url: url }
        {
          onSuccess: successCallback
          onFailure: ->
            log.error "supersonic.app.openURL could not open URL"
            reject()
        }
      )


  return openURL