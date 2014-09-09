Promise = require 'bluebird'

module.exports =
  alert: (options) ->
    message = if typeof options is "string"
      options
    else if options?.message?
      options.message
    else

    title = options?.title || "Alert"
    buttonLabel = options?.buttonLabel || "OK"

    new Promise (resolve) ->
      document.addEventListener "deviceready", ->
        navigator.notification.alert message, resolve, title, buttonLabel

  confirm: (options) ->
    message = if typeof options is "string"
      options
    else if options?.message?
      options.message
    else

    title = options?.title || "Confirm"
    buttonLabels = options?.buttonLabels || ["OK","Cancel"]

    new Promise (resolve) ->
      callback = (index) ->
        resolve(index-1) # Cordova indexing starts at 1

      document.addEventListener "deviceready", ->
        navigator.notification.confirm message, callback, title, buttonLabels
