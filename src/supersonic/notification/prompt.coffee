Promise = require 'bluebird'

{deviceready} = require '../events'

###*
 * @ngdoc method
 * @name prompt
 * @module notification
 * @description
 * Shows a native prompt dialog.
 * @param {string} message confirm dialog (shorthand).
 * @param {Object} options an options object (verbose). The following properties are available:
 * * `message`: confirm message
 * * `title`: dialog title (optional, defaults to "Confirm")
 * * `buttonLabels`: array of strings specifying button labels (optional, defaults to ["OK","Cancel"]).
 * * `defaultText`: default textbox input value (optional, defaults to an empty string)
 * @returns {Promise} Promise that is resolved with an object as an argument. The argument object has the following properties:
 * * `buttonIndex`: index of the pressed button
 * * `input`: input string
 * @usage
 * ```coffeescript
 * # Shorthand
 * supersonic.notification.prompt("This is a prompt. Type something")
 *
 * # Verbose
 * options =
 *   title: "Custom Title"
 *   message: "I'm a prompt!"
 *   buttonLabels: ["Yes", "No", "Cancel"]
 *   defaultText: "Type here"
 * supersonic.notification.prompt(options)
 * ```
###
module.exports = (options) ->
  message = if typeof options is "string"
    options
  else if options?.message?
    options.message
  else
    new String
  title = options?.title || "Prompt"
  buttonLabels = options?.buttonLabels || ["OK","Cancel"]
  defaultText = options?.defaultText || new String

  deviceready
    .then(->
      new Promise (resolve) ->
        navigator.notification.prompt message, resolve, title, buttonLabels, defaultText
    ).then (results) ->
        buttonIndex: results.buttonIndex-1 # Cordova indexing starts at 1
        input: results.input1
