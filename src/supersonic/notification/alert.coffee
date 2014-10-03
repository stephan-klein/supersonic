Promise = require 'bluebird'

{deviceready} = require '../events'

###*
 * @category core
 * @module notification
 * @name alert
 * @function
 * @description
 * Shows a native alert box.
 * @param {string} message alert message.
 * @param {Object} options an options object (optional). The following properties are available:
 * * `title`: alert title (optional, defaults to "Alert")
 * * `buttonName`: button name (optional, defaults to "OK")
 * @returns {Promise} Promise that is resolved when the the button in the alert box is tapped.
 * @usage
 * ```coffeescript
 * # Basic usage
 * supersonic.notification.alert("You are awesome!")
 *
 * # With options
 * supersonic.notification.alert("I'm an alert!", {
 *   title: "Custom Title"
 *   buttonLabel: "Close"
 * })
 * ```
###

module.exports = (message, options = {}) ->
  
  msg = message || new String
  title = options?.title || "Alert"
  buttonLabel = options?.buttonLabel || "OK"

  deviceready.then ->
    new Promise (resolve) ->
      navigator.notification.alert msg, resolve, title, buttonLabel

