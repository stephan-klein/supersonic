Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.app"

  ###
   # @category core
   # @module app
   # @name getLaunchURL
   # @function
   # @apiCall supersonic.app.getLaunchURL
   # @description
   # Returns the string that was used to launch the application with URL scheme.
   # @type
   # supersonic.app.getLaunchURL: ()
   # => Promise launchURL: String
   # @returnsDescription
   # Returns a [Promise](todo) that is resolved with the launch URL string as an argument when the application was launched using an URL schema.
   # @define {=>String} launchURL The launch URL.
   # @usageCoffeeScript
   # supersonic.app.getLaunchURL()
   # @exampleCoffeeScript
   # supersonic.app.getLaunchURL().then (launchURL) ->
   #  steroids.logger.log "Launch URL: #{launchURL}"
  ###
  getLaunchURL = bug "getLaunchURL", ->
    new Promise (resolve, reject) ->
      launchURL = steroids.app.getLaunchURL()
      if launchURL?
        resolve launchURL
      else
        reject()

  return getLaunchURL