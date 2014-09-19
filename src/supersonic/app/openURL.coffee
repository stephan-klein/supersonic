Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.app"

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
  openURL = bug "openURL", (url) ->
    new Promise (resolve, reject) ->
      successCallback = ->
        document.addEventListener "resume", ->
          resolve()

      steroids.openURL(
        { url: url }
        {
          onSuccess: successCallback
          onFailure: ->
            reject()
        }
      )


  return openURL