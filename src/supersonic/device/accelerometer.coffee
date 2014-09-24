Promise = require 'bluebird'
Bacon = require 'baconjs'

{deviceready} = require '../events'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.accelerometer"

  ###*
   * @ngdoc overview
   * @name accelerometer
   * @module device
   * @description
   *  provides access to the device's accelerometer. The accelerometer is a motion sensor that detects the change (delta) in movement relative to the current device orientation, in three dimensions along the x, y, and z axis.
  ###
    
  ###*
   * @ngdoc method
   * @name watchPosition
   * @module accelerometer
   * @description
   * Returns a stream of acceleration updates.
   * @returns {Stream} Stream of acceleration updates
   * @usage
   * ```coffeescript
   * supersonic.device.accelerometer.watchPosition().onValue( (acceleration) ->
   *  console.log('Acceleration X: '  + acceleration.x  + '\n' +
   *              'Acceleration Y: ' + acceleration.y + '\n' +
   *              'Acceleration Z: ' + acceleration.z + '\n' +
   *              'Timestamp: ' + acceleration.timestamp)
   * )
   * ```
  ###
  watchAcceleration = (options = {}) ->

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
   * @ngdoc method
   * @name getAcceleration
   * @module accelerometer
   * @description
   * Returns device's current acceleration.
   * @returns {Promise} Promise is resolved to the next available acceleration data. Will wait for data for an indeterminate time; use a timeout if required.
   * @usage
   * ```coffeescript
   * supersonic.device.geolocation.getAcceleration().then( (acceleration) ->
   *  console.log('Acceleration X: '  + acceleration.x  + '\n' +
   *              'Acceleration Y: ' + acceleration.y + '\n' +
   *              'Acceleration Z: ' + acceleration.z + '\n' +
   *              'Timestamp: ' + acceleration.timestamp)
   * )
   * ```
  ###
  getAcceleration = (options = {}) ->
    new Promise (resolve) ->
      watchAcceleration(options).take(1).onValue resolve

  return {watchAcceleration, getAcceleration}