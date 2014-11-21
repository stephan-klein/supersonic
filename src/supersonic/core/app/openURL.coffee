Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.app', log

  ###
   # @namespace supersonic.app
   # @name openURL
   # @function
   # @apiCall supersonic.app.openURL
   # @description
   # Launches a browser to open the given URL, or the external application matching the URL scheme.
   # @type
   # supersonic.app.openURL: (URL: String) =>
   #   Promise
   # @define {String} URL The URL to be opened. URLs starting with "http(s)://" will be opened in the device's default browser.
   # @returnsDescription
   # Promise that is resolved when the URL is opened. The promise is rejected if the URL scheme could not be found among the URL schemes registered by the device's apps.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # # Launch the default web browser
   # supersonic.app.openURL "http://www.google.com"
   #
   # # Launch an external app
   # supersonic.app.openURL("sms:1-408-555-121").then ->
   #   supersonic.logger.log "URL successfully opened"
   #
   # # Invalid schemes result in a rejected promise
   # supersonic.app.openURL("doesnotexist://).catch ->
   #   supersonic.logger.log "Could not open URL"
   # @exampleJavaScript
   # // Launch the default web browser
   # supersonic.app.openURL("http://www.google.com");
   #
   # // Launch an external app
   # supersonic.app.openURL("sms:1-408-555-121").then(function() {
   #   supersonic.logger.log("SMS app successfully opened");
   # });
   #
   # // Invalid schemes result in a rejected promise
   # supersonic.app.openURL("doesnotexist://").catch(function() {
   #   supersonic.logger.log("Could not open URL");
   # });
  ###
  openURL = s.promiseF "openURL", (url) ->
    # Trying to open with null will crash the app
    return Promise.reject("URL is undefined") unless url?

    new Promise (resolve, reject) ->
      steroids.openURL(
        { url: url }
        {
          onSuccess: resolve
          onFailure: reject
        }
      )

  return openURL
