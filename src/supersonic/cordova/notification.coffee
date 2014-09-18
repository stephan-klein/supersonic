Promise = require 'bluebird'

module.exports =
  ###*
   * @ngdoc method
   * @name alert
   * @module notification
   * @description
   * Shows a native alert box.
   * @param {string} alert message.
   * @returns {Promise} Promise that is resolved when the the button in the alert box is tapped.
   * @usage
   * ```coffeescript
   * supersonic.notification.alert("You are awesome!")
   * supersonic.notification.alert(
   *  {
   *   }
   * )
   * ```
  ###
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

  vibrate: (options) ->
    time = if typeof options is "number"
      options
    else

    new Promise (resolve) ->
      document.addEventListener "deviceready", ->
        resolve navigator.notification.vibrate(time)

  prompt: (options) ->
    message = if typeof options is "string"
      options
    else if options?.message?
      options.message
    else
      new String

    title = options?.title || "Prompt"
    buttonLabels = options?.buttonLabels || ["OK","Cancel"]
    defaultText = options?.defaultText || new String

    new Promise (resolve) ->
      callback = (results) ->
        result =
          buttonIndex: results.buttonIndex-1 # Cordova indexing starts at 1
          input: results.input1
        resolve result
            
      document.addEventListener "deviceready", ->
        navigator.notification.prompt message, callback, title, buttonLabels, defaultText