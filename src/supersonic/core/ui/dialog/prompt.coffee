Promise = require 'bluebird'

{deviceready} = require '../../events'

superify = require '../../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.dialog', log

  ###
   # @namespace supersonic.ui.dialog
   # @name prompt
   # @function
   # @apiCall supersonic.ui.dialog.prompt
   # @description
   # Displays a native prompt dialog.
   # @type
   # supersonic.ui.dialog.prompt : (
   #   title?: String,
   #   options?: {
   #     message?: String,
   #     buttonLabels?: Array<String>,
   #     defaultText?: String
   #   }
   # ) => Promise { buttonIndex: Integer, input: String }
   # @define {String} title="Prompt" Title text for the prompt dialog.
   # @define {Object} options={} Optional options object.
   # @define {String} options.message="" Additional message shown under the title.
   # @define {Array<String>} options.buttonLables=["OK","Cancel"] Array of strings specifying button labels.
   # @define {String} options.defaultText="" Default value for the prompt input textbox.
   # @returnsDescription
   # Returns a Promise. Once the prompt dialog is dismissed (by tapping on one of the buttons), the promise is resolved with an object that has the following properties.
   # @define {=>Object} result Result object.
   # @define {=>Integer} result.buttonIndex Index of the button tapped by the user.
   # @define {=>String} result.input String inputted by user.
   # @exampleCoffeeScript
   # options =
   #   title: "Please type some text and click on the desired color"
   #   buttonLabels: ["Blue", "Red", "Yellow"]
   #   defaultText: "Type here"
   #
   # supersonic.ui.dialog.prompt("Colorize text", options).then (result)->
   #   supersonic.logger.log "User clicked button number #{result.buttonIndex} with text #{result.input}"
   # @exampleJavaScript
   # var options = {
   #   title: "Please type some text and click on the desired color",
   #   buttonLabels: ["Blue", "Red", "Yellow"],
   #   defaultText: "Type here"
   # };
   #
   # supersonic.ui.dialog.prompt("Colorize text", options).then(function(result) {
   #   supersonic.logger.log("User clicked button number " + result.buttonIndex + " with text " + result.input);
   # });
  ###
  prompt = s.promiseF "prompt", (title, options = {}) ->
  
    title = title || "Prompt"
    msg = options?.message || new String
    buttonLabels = options?.buttonLabels || ["OK","Cancel"]
    defaultText = options?.defaultText || new String
  
    deviceready
      .then(->
        new Promise (resolve) ->
          navigator.notification.prompt msg, resolve, title, buttonLabels, defaultText
      ).then (result) ->
          buttonIndex: result.buttonIndex-1 # Cordova indexing starts at 1
          input: result.input1

  return prompt
  