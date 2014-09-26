supersonic = require './core'
superscope = require './angular/superscope'

module.exports = (angular) ->
  superscope(angular)

  angular
    .module('supersonic', [
      'supersonic.superscope'
    ])
    .service('supersonic', ($q) ->
      qify = (f) -> (args...) -> $q.when f args...
      # NOTE: When qifying an instance of a class, it is
      # worth to preserve the context. The 'qify' is compilated into
      # f.call(null, args) which means loosing the context. Please
      # take this into account when refactoring.
      qifyAll = (object) ->
        result = {}
        for key, value of object
          result[key] = switch true
            when value instanceof Function then qify value
            when value instanceof Object then qifyAll value
            else value
        result

      # TODO: Every module should define themselves if they are wrapped
      # or not.

      geolocation =  supersonic.device.geolocation
      geolocation.getPosition = qify geolocation.getPosition
      accelerometer =  supersonic.device.accelerometer
      accelerometer.getAcceleration = qify accelerometer.getAcceleration
      {
        logger: qifyAll supersonic.logger
        debug: qifyAll supersonic.debug
        app: qifyAll supersonic.app
        media: qifyAll supersonic.media
        notification: qifyAll supersonic.notification
        device: supersonic.device
        ui: supersonic.ui
      }
    )
