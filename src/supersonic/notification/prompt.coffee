Promise = require 'bluebird'

{deviceready} = require '../events'

###
 # @category core
 # @module notification
 # @name prompt
 # @function
 # @apiCall supersonic.notification.prompt
 # @description
 # Displays a native prompt dialog.
 # @type
 # supersonic.notification.prompt: (
 #   title?: String,
 #   options?: {
 #     message?: String,
 #     buttonLabels?: Array<String>,
 #     defaultText?: String
 #   }
 # ) => Promise { buttonIndex: Integer, input: String }
 # @define {String} title="Prompt" Title text for the prompt.
 # @define {Object} options={} An optional options object.
 # @define {String} options.message="" Additional message shown under the title.
 # @define {Array<String>} options.buttonLables=["OK","Cancel"] An array of strings specifying button labels.
 # @define {String} options.defaultText="" Default value for the prompt input textbox.
 # @returnsDescription
 # Returns a Promise. Once the prompt dialog is dismissed (by tapping on one of the buttons), the promise is resolved with an object that has the following properties.
 # @define {=>Integer} buttonIndex Index of the button tapped by user.
 # @define {=>String} input String inputted by user.
 # @usageCoffeeScript
 # supersonic.notification.prompt "Type something!", options
 # @exampleCoffeeScript
 # supersonic.notification.prompt("Colorize text", {
 #   title: "Please type some text and click on the desired color"
 #   buttonLabels: ["Blue", "Red", "Yellow"]
 #   defaultText: "Type here"
 # }).then (result)->
 #   supersonic.logger.log "User clicked button number #{result.buttonIndex} with text #{result.input}"
###
module.exports = (title, options = {}) ->

  title = title || "Prompt"
  msg = options?.message || new String
  buttonLabels = options?.buttonLabels || ["OK","Cancel"]
  defaultText = options?.defaultText || new String

  deviceready
    .then(->
      new Promise (resolve) ->
        navigator.notification.prompt msg, resolve, title, buttonLabels, defaultText
    ).then (results) ->
        buttonIndex: results.buttonIndex-1 # Cordova indexing starts at 1
        input: results.input1
