Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.geolocation"

  deviceready: ->
    new Promise((resolve) ->
     document.addEventListener 'deviceready', resolve
  )

  ###*
   * @ngdoc overview
   * @name geolocation
   * @module device
   * @description
   * Provides access to location data based on the device's GPS sensor or inferred from network signals.
  ###
    
  ###*
   * @ngdoc method
   * @name watchPosition
   * @module geolocation
   * @description
   * Returns a stream of position updates.
   * @returns {Stream} Stream of position updates
   * @usage
   * ```coffeescript
   * supersonic.device.geolocation.watchPosition()
   * ```
  ###
  watchPosition: bug "watchPosition", (options = {}) ->
    deviceready.then ->
      options.enableHighAccuracy ?= true
  
      Bacon.fromPromise(ready).flatMap ->
        Bacon.fromBinder (sink) ->
          watchId = window.navigator.geolocation.watchPosition(
            (position) -> sink new Bacon.Next position
            (error) -> sink new Bacon.Error error
            options
          )
          ->
            window.navigator.geolocation.clearWatch watchId
  
  ###*
   * @ngdoc method
   * @name enable
   * @module getPosition
   * @description
   * Returns device's current position.
   * @returns {Promise} Promise is resolved to the next available position data. Will wait for data for an indeterminate time; use a timeout if required.
   * @usage
   * ```coffeescript
   * supersonic.device.geolocation.getPosition()
   * ```
  ###
  getPosition: bug "getPosition", (options = {}) ->
    new Promise (resolve) ->
      watchPosition(options).take(1).onValue resolve