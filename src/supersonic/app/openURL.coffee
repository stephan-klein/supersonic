Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.app"

  ###*
   * @category core
   * @module app
   * @name openURL
   * @function
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
    # Trying to open with null will crash the app
    return Promise.reject("URL is undefined") unless url?

    new Promise (resolve, reject) ->
      steroids.openURL(
        { url: url }
        {
          onSuccess: ->
            document.addEventListener "resume", resolve
          onFailure: reject
        }
      )


  return openURL