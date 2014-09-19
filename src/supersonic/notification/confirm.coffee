Promise = require 'bluebird'

###*
 * @ngdoc method
 * @name confirm
 * @module notification
 * @description
 * Shows a native confirm dialog.
 * @param {string} message confirm message (shorthand).
 * @param {Object} options an options object (verbose). The following properties are available:
 * * `message`: confirm message
 * * `title`: confirm title (optional, defaults to "Confirm")
 * * `buttonLabels`: Array of strings specifying button labels (optional, defaults to ["OK","Cancel"]).
 * @returns {Promise} Promise that is resolved with the index of the tapped button as an argument.
 * @usage
 * ```coffeescript
 * # Shorthand
 * supersonic.notification.confirm("You are awesome!")
 *
 * # Verbose
 * options =
 *   title: "Custom Title"
 *   message: "I'm a confirm!"
 *   buttonLabel: ["Yes", "Close"]
 * supersonic.notification.confirm(options)
 * ```
###
module.exports = (options) ->
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


 