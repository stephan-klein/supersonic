Promise = require 'bluebird'
Bacon = require 'baconjs'

{deviceready} = require '../events'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.accelerometer"

  ###*
   * @category core
   * @module device
   * @name accelerometer
   * @overview
   * @description
   *  provides access to the device's accelerometer. The accelerometer is a motion sensor that detects the change (delta) in movement relative to the current device orientation, in three dimensions along the x, y, and z axis.
  ###
    
  ###*
   * @module accelerometer
   * @name watchAcceleration
   * @function
   * @description
   * Returns a stream of acceleration updates.
   * @param {Integer} frequency update interval in milliseconds (optional, defaults to 40)
   * @returns {Stream} Stream of acceleration updates
   * @usage
   * ```coffeescript
   * supersonic.device.accelerometer.watchAcceleration().onValue( (acceleration) ->
   *  console.log('Acceleration X: '  + acceleration.x  + '\n' +
   *              'Acceleration Y: ' + acceleration.y + '\n' +
   *              'Acceleration Z: ' + acceleration.z + '\n' +
   *              'Timestamp: ' + acceleration.timestamp)
   * )
   * ```
  ###
  watchAcceleration = (frequency = 40) ->
    options = { frequency }
    Bacon.fromPromise(deviceready).flatMap ->
      Bacon.fromBinder (sink) ->
        watchId = window.navigator.accelerometer.watchAcceleration(
          (acceleration) -> sink new Bacon.Next acceleration
          (error) -> sink new Bacon.Error error
          options
        )
        ->
          window.navigator.accelerometer.clearWatch watchId
  
  ###*
   * @module accelerometer
   * @name getAcceleration
   * @function
   * @description
   * Returns device's current acceleration.
   * @returns {Promise} Promise is resolved to the next available acceleration data. Will wait for data for an indeterminate time; use a timeout if required.
   * @usage
   * ```coffeescript
   * supersonic.device.accelerometer.getAcceleration().then( (acceleration) ->
   *  console.log('Acceleration X: '  + acceleration.x  + '\n' +
   *              'Acceleration Y: ' + acceleration.y + '\n' +
   *              'Acceleration Z: ' + acceleration.z + '\n' +
   *              'Timestamp: ' + acceleration.timestamp)
   * )
   * ```
  ###
  getAcceleration = bug "getAcceleration", ->
    new Promise (resolve) ->
      watchAcceleration().take(1).onValue resolve

  return {watchAcceleration, getAcceleration}