Promise = require 'bluebird'

###*
 * @ngdoc method
 * @name vibrate
 * @module notification
 * @description
 * Vibrates the device for the specified amount of time.
 * @param {Number} time time in illiseconds to vibrate the device. Please note: iOS ignores the time parameter and always vibrates for a pre-set amount of time.
 * @returns {Promise} Promise that is resolved when the native side has vibrated.
 * @usage
 * ```coffeescript
 * supersonic.notification.vibrate(2500)
 * ```
###

module.exports = (options) ->
  time = if typeof options is "number"
    options
  else
  new Promise (resolve) ->
    document.addEventListener "deviceready", ->
      resolve navigator.notification.vibrate(time)
      