supersonic = require '../core'

module.exports = (angular) ->
  angular
    .module('supersonic.device', [])
    .service('supersonicDevice', (qify, $q) ->

      decorate = (object, decorator) ->
        result = {}
        for key, value of object
          result[key] = value

        for key, value of decorator(result)
          result[key] = value

        result

      do (device = supersonic.device) ->
        {
          accelerometer: decorate device.accelerometer, (accelerometer) ->
            getAcceleration: qify accelerometer.getAcceleration

          compass: decorate device.compass, (compass) ->
            getHeading: qify compass.getHeading

          geolocation: decorate device.geolocation, (geolocation) ->
            getPosition: qify geolocation.getPosition

          platform: qify device.platform

          vibrate: qify device.vibrate

          ready: $q.when device.ready
        }
    )
