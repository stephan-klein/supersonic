Promise = require 'bluebird'

{deviceready} = require '../events'

###
 # @category core
 # @module notification
 # @name alert
 # @function
 # @apiCall supersonic.notification.alert
 # @description
 # Shows a native alert dialog.
 # @type
 # supersonic.notification.alert: (
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
 # supersonic.notification.alert "Who's awesome? You're awesome!", options
 # @exampleCoffeeScript
 # supersonic.notification.alert("Custom title!", {
 #   message: "A longer message with \n\n\n\nmultiple lines."
 #   buttonLabel: "Close"
 # }).then ->
 #   supersonic.logger.log "Alert closed."
###

module.exports = (title, options = {}) ->

  title = title || "Alert"
  message = options?.message || new String
  buttonLabel = options?.buttonLabel || "OK"

  deviceready.then ->
    new Promise (resolve) ->
      navigator.notification.alert message, resolve, title, buttonLabel