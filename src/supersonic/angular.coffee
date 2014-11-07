supersonic = require './core'
superscope = require './angular/superscope'
supersonicHelpers = require './angular/helpers'
supersonicDevice = require './angular/device'
supersonicApp = require './angular/app'

module.exports = (angular) ->
  superscope(angular)
  supersonicHelpers(angular)
  supersonicApp(angular)
  supersonicDevice(angular)


  angular
    .module('supersonic', [
      'supersonic.helpers'
      'supersonic.superscope'
      'supersonic.device'
      'supersonic.app'
    ])
    .service('supersonic', (supersonicDevice, supersonicApp, qifyAll) ->
      {
        logger: qifyAll supersonic.logger
        debug: qifyAll supersonic.debug
        app: supersonicApp
        media: qifyAll supersonic.media
        device: supersonicDevice
        ui: supersonic.ui
      }
    )
