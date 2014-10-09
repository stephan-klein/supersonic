Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.app"

  ###
   # @category core
   # @module app
   # @name openURL
   # @function
   # @apiCall supersonic.app.openURL
   # @description
   # Launches browser to open the URL or any external application with that applications URL scheme.
   # @type
   # supersonic.app.openURL: (URL: String)
   # => Promise
   # @define {String} URL URL to be opened. URLs starting with "http(s)://" will be opened in the device's browser.
   # @returnsDescription
   # [Promise](todo) that is resolved when the application is resumed.
   # @usageCoffeeScript
   # supersonic.app.openURL URL
   # @exampleCoffeeScript
   # supersonic.app.openURL("otherapp://?foo=1&bar=2").then ->
   #  supersonic.logger.log "Application resumed"
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