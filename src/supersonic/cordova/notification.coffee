Promise = require 'bluebird'

module.exports =
  alert: (options) ->
    message = if typeof options is "string"
      options
    else if options?.message?
      options.message
    else
      ""

    title = options?.title || "Alert"
    buttonLabel = options?.buttonLabel || "OK"

    new Promise (resolve) ->
      navigator.notification.alert message, resolve, title, buttonLabel
