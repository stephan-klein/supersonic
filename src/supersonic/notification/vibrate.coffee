Promise = require 'bluebird'

{deviceready} = require '../events'

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
      null

  # TODO: Actually resolve the promise only after the vibration is done
  deviceready.then ->
    new Promise (resolve) ->
      resolve navigator.notification.vibrate(time)
      