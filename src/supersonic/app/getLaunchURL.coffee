Promise = require 'bluebird'
log = require '../core/logger'

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
  
  log.debug "supersonic.app.getLaunchURL called"
  new Promise (resolve, reject) ->
    launchURL = steroids.app.getLaunchURL()
    if launchURL?
      log.debug "supersonic.app.getLaunchURL got #{launchURL}"
      resolve launchURL
    else
      log.error "supersonic.app. didn't get a launch URL"
      reject()