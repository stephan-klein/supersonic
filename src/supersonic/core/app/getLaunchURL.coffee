Promise = require 'bluebird'

module.exports = (steroids) ->
  getParsedParamsFromURL = (url)->
    query = url.substring(url.indexOf("?") + 1)
    result = {}

    for part in query.split "&"
      item = part.split "="
      result[item[0]] = decodeURIComponent item[1]

    result

  ###
   # @namespace supersonic.app
   # @name getLaunchURL
   # @function
   # @apiCall supersonic.app.getLaunchURL
   # @description
   # Returns the string that was used to launch the application with URL scheme.
   # @type
   # supersonic.app.getLaunchURL: () =>
   #   {
   #     launchURL: String,
   #     params: Object
   #   }
   # @returnsDescription
   # Returns an object that contains the launch URL and its parsed params. If the app hadn't been opened via its URL scheme, the returned object is `null`.
   # @define {=>String} launchURL The full URL that was used to launch this app.
   # @define {=>Object} params An object containing the parameters parsed from the URL string. Contains an empty object if no parameters were present on the launch URL.
   # @define {=>Object} params.param An object whose key matches the parameter name and value its value, e.g. `"password=monkey"` produces an object `{password: "monkey"}`
   # @exampleCoffeeScript
   # urlObject = supersonic.app.getLaunchURL()
   #
   # if urlObject?
   #   supersonic.logger.log "Got launch URL #{urlObject.launchURL} with params: #{urlObject.params}"
   # else
   #   supersonic.logger.error "Could not get a launch URL."
   #
   # @exampleJavaScript
   # var urlObject = supersonic.app.getLaunchURL();
   #
   # if (urlObject != null) {
   #   supersonic.logger.log("Got launch URL " + urlObject.launchURL + " with params: " + urlObject.params);
   # } else {
   #   supersonic.logger.error("Could not get a launch URL.");
   # }
  ###

  getLaunchURL = ->
    launchURL = steroids.app.getLaunchURL()
    if launchURL?
      launchURL: launchURL
      params: getParsedParamsFromURL launchURL
    else
      null

  return getLaunchURL
