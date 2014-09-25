Promise = require 'bluebird'

{deviceready} = require '../events'

###*
 * @ngdoc method
 * @name prompt
 * @module notification
 * @description
 * Shows a native prompt dialog.
 * @param {string} message confirm message.
 * @param {Object} options an options object (optionals). The following properties are available:
 * * `title`: dialog title (optional, defaults to "Confirm")
 * * `buttonLabels`: array of strings specifying button labels (optional, defaults to ["OK","Cancel"]).
 * * `defaultText`: default textbox input value (optional, defaults to an empty string)
 * @returns {Promise} Promise that is resolved with an object as an argument. The argument object has the following properties:
 * * `buttonIndex`: index of the pressed button
 * * `input`: input string
 * @usage
 * ```coffeescript
 * # Basic usage
 * supersonic.notification.prompt("This is a prompt. Type something")
 *
 * # With options
 * supersonic.notification.prompt("I'm a prompt!", {
 *   title: "Custom Title"
 *   buttonLabels: ["Yes", "No", "Cancel"]
 *   defaultText: "Type here"
 * })
 * ```
###
module.exports = (message, options = {}) ->
  
  msg = message || new String
  title = options?.title || "Prompt"
  buttonLabels = options?.buttonLabels || ["OK","Cancel"]
  defaultText = options?.defaultText || new String

  deviceready
    .then(->
      new Promise (resolve) ->
        navigator.notification.prompt msg, resolve, title, buttonLabels, defaultText
    ).then (results) ->
        buttonIndex: results.buttonIndex-1 # Cordova indexing starts at 1
        input: results.input1
