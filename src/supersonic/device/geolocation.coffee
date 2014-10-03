Promise = require 'bluebird'
Bacon = require 'baconjs'

{deviceready} = require '../events'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.geolocation"

  ###*
   * @category core
   * @module device
   * @name geolocation
   * @overview
   * @description
   * Provides access to location data based on the device's GPS sensor or inferred from network signals.
  ###
    
  ###*
   * @module geolocation
   * @name watchPosition
   * @function
   * @description
   * Returns a stream of position updates.
   * @returns {Stream} Stream of position updates
   * @usage
   * ```coffeescript
   * supersonic.device.geolocation.watchPosition().onValue( (position) ->
   *  console.log('Latitude: '  + position.coords.latitude  + '\n' +
   *                        'Longitude: ' + position.coords.longitude + '\n' +
   *                        'Timestamp: ' + position.timestamp)
   * )
   * ```
  ###
  watchPosition = (options = {}) ->
  
    options.enableHighAccuracy ?= true

    Bacon.fromPromise(deviceready).flatMap ->
      Bacon.fromBinder (sink) ->
        watchId = window.navigator.geolocation.watchPosition(
          (position) -> sink new Bacon.Next position
          (error) -> sink new Bacon.Error error
          options
        )
        ->
          window.navigator.geolocation.clearWatch watchId
  
  ###*
   * @module geolocation
   * @name getPosition
   * @function
   * @description
   * Returns device's current position.
   * @returns {Promise} Promise is resolved to the next available position data. Will wait for data for an indeterminate time; use a timeout if required.
   * @usage
   * ```coffeescript
   * supersonic.device.geolocation.getPosition().then( (position) ->
   *  console.log('Latitude: '  + position.coords.latitude  + '\n' +
   *                        'Longitude: ' + position.coords.longitude + '\n' +
   *                        'Timestamp: ' + position.timestamp)
   * )
   * ```
  ###
  getPosition = (options = {}) ->
    new Promise (resolve) ->
      watchPosition(options).take(1).onValue resolve

  return {watchPosition, getPosition}