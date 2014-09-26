Promise = require 'bluebird'
Bacon = require 'baconjs'

{deviceready} = require '../events'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.compass"

  ###*
   * @ngdoc overview
   * @name compass
   * @module device
   * @description
   *  provides access to the device's compass. The compass is a sensor that detects the direction or heading that the device is pointed, typically from the top of the device. It measures the heading in degrees from 0 to 359.99, where 0 is north.
  ###
    
  ###*
   * @ngdoc method
   * @name watchHeading
   * @module compass
   * @description
   * Returns a stream of compass heading updates.
   * @param {Object} [options] Options object (optional). The following properties are available:
   * * `frequency`: update interval in milliseconds (Number, optional) Defaults to 100.
   * * `filter`: The change in degrees required to initiate a watchHeading success callback (Number, optional). When this value is set, `frequency` is ignored.
   * @returns {Stream} Stream of heading updates.
   * @usage
   * ```coffeescript
   * supersonic.device.compass.watchHeading().onValue( (heading) ->
   *  console.log('Magnetic heading: ' + heading.magneticHeading  + '\n' +
   *              'True heading: ' + heading.trueHeading + '\n' +
   *              'Heading accuracy: ' + heading.headingAccuracy + '\n' +
   *              'Timestamp: ' + heading.timestamp)
   * )
   * ```
  ###
  watchHeading = (options = {}) ->
    compassOptions =
      frequency: options?.frequency? || 100
      filter: options?.filter? || null

    Bacon.fromPromise(deviceready).flatMap ->
      Bacon.fromBinder (sink) ->
        watchId = window.navigator.compass.watchHeading(
          (heading) -> sink new Bacon.Next heading
          (error) -> sink new Bacon.Error error
          compassOptions
        )
        ->
          window.navigator.compass.clearWatch watchId
  
  ###*
   * @ngdoc method
   * @name getHeading
   * @module compass
   * @description
   * Returns device's current heading.
   * @returns {Promise} Promise is resolved to the next available heading data.
   * @usage
   * ```coffeescript
   * supersonic.device.compass.getHeading().then( (heading) ->
   *  console.log('Magnetic heading: ' + heading.magneticHeading  + '\n' +
   *              'True heading: ' + heading.trueHeading + '\n' +
   *              'Heading accuracy: ' + heading.headingAccuracy + '\n' +
   *              'Timestamp: ' + heading.timestamp)
   * )
   * ```
  ###
  getHeading = ->
    new Promise (resolve) ->
      watchHeading().take(1).onValue resolve

  return {watchHeading, getHeading}