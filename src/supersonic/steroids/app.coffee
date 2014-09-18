Promise = require 'bluebird'

module.exports = (steroids) ->

  getLaunchURL: ->
    new Promise (resolve, reject) ->
      launchURL = steroids.app.getLaunchURL()
      if launchURL?
        resolve launchURL
      else
        reject()
        
  sleep:
    disable: ->
      new Promise (resolve) ->
        steroids.device.disableSleep(
          {}
          {
            onSuccess: resolve
          }
        )
    enable: ->
      new Promise (resolve) ->
        steroids.device.enableSleep(
          {}
          {
            onSuccess: resolve
          }
        )
      
  splashscreen:
    show: ->
      new Promise (resolve, reject) ->
        steroids.splashscreen.show(
          {}
          {
            onSuccess: resolve
            onFailure: reject
          }
        )
    hide: ->
      new Promise (resolve, reject) ->
        steroids.splashscreen.hide(
          {}
          {
            onSuccess: resolve
            onFailure: reject
          }
        )
