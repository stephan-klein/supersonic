Promise = require 'bluebird'

{deviceready} = require '../events'

###
 * @category core
 * @module notification
 * @name confirm
 * @function
 * @description
 * Shows a native confirm dialog.
 * @param {string} message confirm message
 * @param {Object} [options] an options object. The following properties are available:
 * * `title`: confirm title (optional, defaults to "Confirm")
 * * `buttonLabels`: Array of strings specifying button labels (optional, defaults to ["OK","Cancel"]).
 * @returns {Promise} Promise that is resolved with the index of the tapped button as an argument.
 * @usage
 * ```coffeescript
 * # Basic usage
 * supersonic.notification.confirm("You are awesome!")
 *
 * # With options
 * supersonic.notification.confirm("I'm a confirm!", {
 *   title: "Custom Title"
 *   buttonLabels: ["Yes", "Close"]
 * })
 * ```
###
module.exports = (message, options = {}) ->

  msg = message || new String
  title = options?.title || "Confirm"
  buttonLabels = options?.buttonLabels || ["OK","Cancel"]

  deviceready
    .then(->
      new Promise (resolve) ->
        navigator.notification.confirm msg, resolve, title, buttonLabels
    ).then (index) ->
      index - 1 # Cordova indexing starts at 1
