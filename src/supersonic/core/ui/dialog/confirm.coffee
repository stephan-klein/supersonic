Promise = require 'bluebird'

{deviceready} = require '../../events'

superify = require '../../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.dialog', log

  ###
   # @namespace supersonic.ui.dialog
   # @name confirm
   # @function
   # @apiCall supersonic.ui.dialog.confirm
   # @description
   # Shows a native confirm dialog.
   # @type
   # supersonic.ui.dialog.confirm : (
   #   title?: String,
   #   options?: {
   #     message?: String,
   #     buttonLabels?: Array<String>
   #   }
   # ) => Promise buttonIndex: Integer
   # @define {String} title="Confirm" Title text for the confirm dialog.
   # @define {Object} options={} Optional options object.
   # @define {String} message="" Additional message
   # @define {Array<String>} buttonLabels=["OK","Cancel"] Array of strings specifying button labels.
   # @returnsDescription
   # Returns a [`Promise`](/supersonic/guides/technical-concepts/promises/). Once the confirm dialog is dismissed (by tapping on one of the buttons), the promise resolves with the index of the button tapped.
   # @define {=>Integer} buttonIndex Index of the button tapped by the user.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # options =
   #   message: "Please reply honestly, now."
   #   buttonLabels: ["Yes", "No"]
   #
   # supersonic.ui.dialog.confirm("Are you awesome?", options).then (index)->
   #   if result.index is 0
   #     supersonic.logger.log "User is awesome!"
   #   else
   #     supersonic.logger.log "User wasn't awesome. :("
   # @exampleJavaScript
   # var options = {
   #   message: "Please reply honestly, now.",
   #   buttonLabels: ["Yes", "No"]
   # };
   #
   # supersonic.ui.dialog.confirm("Are you awesome?", options).then(function(index) {
   #   if (index == 0) {
   #     supersonic.logger.log("User is awesome!");
   #   } else {
   #     supersonic.logger.log("User wasn't awesome. :(");
   #   }
   # });
  
  ###
  confirm = s.promiseF "confirm", (title, options = {}) ->
  
    title = title || "Confirm"
    message = options?.message || new String
    buttonLabels = options?.buttonLabels || ["OK","Cancel"]
  
    deviceready
      .then(->
        new Promise (resolve) ->
          navigator.notification.confirm message, resolve, title, buttonLabels
      ).then (index) ->
        index - 1 # Cordova indexing starts at 1

  return confirm
