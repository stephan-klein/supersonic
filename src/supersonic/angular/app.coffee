supersonic = require '../core'

module.exports = (angular) ->
  angular
    .module('supersonic.app', [])
    .service('supersonicApp', (qify, qifyAll, $q, $timeout) ->

      decorate = (object, decorator) ->
        result = {}
        for key, value of object
          result[key] = value

        for key, value of decorator(result)
          result[key] = value

        result

      digestifyFunction = (apiFunction)->
        (eventFunction)->
          apiFunction(-> $timeout(eventFunction))

      do (app = supersonic.app) ->
        {
          sleep: qifyAll app.sleep
          getLaunchURL: app.getLaunchURL
          splashscreen: qifyAll app.splashscreen
          openURL: qify app.openURL
          statusBar: qifyAll app.statusBar
          whenPaused: digestifyFunction(app.whenPaused)
          whenResumed: digestifyFunction(app.whenResumed)
        }
    )
