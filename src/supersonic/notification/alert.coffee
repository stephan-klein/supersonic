Promise = require 'bluebird'

###*
 * @ngdoc method
 * @name alert
 * @module notification
 * @description
 * Shows a native alert box.
 * @param {string} message alert message (shorthand).
 * @param {Object} options an options object (verbose). The following properties are available:
 * * `message`: alert message
 * * `title`: alert title (optional, defaults to "Alert")
 * * `buttonName`: button name (optional, defaults to "OK")
 * @returns {Promise} Promise that is resolved when the the button in the alert box is tapped.
 * @usage
 * ```coffeescript
 * # Shorthand
 * supersonic.notification.alert("You are awesome!")
 *
 * # Verbose
 * options =
 *   title: "Custom Title"
 *   message: "I'm an alert!"
 *   buttonLabel: "Close"
 * supersonic.notification.alert(options)
 * ```
###

module.exports = (options) ->
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
