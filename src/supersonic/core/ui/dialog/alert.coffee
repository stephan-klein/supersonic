Promise = require 'bluebird'

{deviceready} = require '../../events'

###
 # @namespace supersonic.ui.dialog
 # @name alert
 # @function
 # @apiCall supersonic.ui.dialog.alert
 # @description
 # Shows a native alert dialog.
 # @type
 # supersonic.ui.dialog.alert : (
 #   title?: String,
 #   options?: {
 #     message?: String,
 #     buttonName?: String
 #   }
 # ) => Promise
 # @define {String} title="Alert" Alert dialog title text.
 # @define {Object} options={} An optional options object.
 # @define {String} options.message="" Optional message text shown under the title.
 # @define {String} options.buttonLabel="OK" Custom button text for the alert dialog.
 # @returnsDescription
 # [Promise](todo), resolved when the the button in the alert dialog is tapped.
 # @usageCoffeeScript
 # supersonic.ui.dialog.alert "Who's awesome? You're awesome!", options
 # @usageJavaScript
 # supersonic.ui.dialog.alert("Who's awesome? You're awesome!", options);
 # @exampleCoffeeScript
 # options =
 #   message: "A longer message with \n\n\n\nmultiple lines."
 #   buttonLabel: "Close"
 #
 # supersonic.ui.dialog.alert("Custom title!", options).then ->
 #   supersonic.logger.log "Alert closed."
 # @exampleJavaScript
 # var options = {
 #   message: "A longer message with \n\n\n\nmultiple lines.",
 #   buttonLabel: "Close"
 # };
 #
 # supersonic.ui.dialog.alert("Custom title!", options).then(function() {
 #   supersonic.logger.log("Alert closed.");
 # });
###

module.exports = (title, options = {}) ->

  title = title || "Alert"
  message = options?.message || new String
  buttonLabel = options?.buttonLabel || "OK"

  deviceready.then ->
    new Promise (resolve) ->
      navigator.notification.alert message, resolve, title, buttonLabel
