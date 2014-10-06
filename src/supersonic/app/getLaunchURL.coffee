Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.app"

  ###
   # @category core
   # @module app
   # @name getLaunchURL
   # @function
   # @description
   # Returns the string that was used to launch the application with URL scheme.
   # @returns {Promise} Promise that is resolved with the launch URL string as an argument when the application was launched using an URL schema.
   # @usage
   # ```coffeescript
   # supersonic.app.getLaunchURL()
   # ```
  ###
  getLaunchURL = bug "getLaunchURL", ->
    new Promise (resolve, reject) ->
      launchURL = steroids.app.getLaunchURL()
      if launchURL?
        resolve launchURL
      else
        reject()

  return getLaunchURL