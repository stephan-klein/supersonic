Promise = require 'bluebird'

module.exports = (steroids) ->

  ###*
   * @ngdoc method
   * @name getLaunchURL
   * @module app
   * @description
   * Returns the string that was used to launch the application with URL scheme.
   * @returns {Promise} Promise that is resolved with the launch URL string as an argument when the application was launched using an URL schema.
   * @usage
   * ```coffeescript
   * supersonic.app.getLaunchURL()
   * ```
  ###
  
  supersonic.logger.log "supersonic.app.getLaunchURL called", "debug"
  new Promise (resolve, reject) ->
    launchURL = steroids.app.getLaunchURL()
    if launchURL?
      supersonic.logger.log "supersonic.app.getLaunchURL got #{launchURL}", "debug"
      resolve launchURL
    else
      supersonic.logger.log "supersonic.app. didn't get a launch URL", "error"
      reject()