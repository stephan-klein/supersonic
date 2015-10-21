Promise = require 'bluebird'
superify = require '../../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.dialog.spinner', log

  ###
   # @namespace supersonic.ui.dialog.spinner
   # @name show
   # @function
   # @apiCall supersonic.ui.dialog.spinner.show
   # @description
   # Shows a native spinner dialog.
   # @type
   # supersonic.ui.dialog.spinner.show : (
   #   text?: String,
   #   options?: {
   #     animated?: Boolean
   #   }
   # ) => Promise
   # @define {String} text="Saving..." Spinner dialog text.
   # @define {Object} options={} An optional options object.
   # @define {String} options.animated=true Optional turn on and off the animation when showing the spinner.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/), resolved when the spinner is displayed.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # options =
   #   animated: false
   #
   # supersonic.ui.dialog.spinner.show("Saving...", options).then ->
   #   supersonic.logger.log "Spinner displayed."
   #
   # @exampleJavaScript
   # var options = {
   #   animated: false
   # };
   #
   # supersonic.ui.dialog.spinner.show("Saving...", options).then(function() {
   #   supersonic.logger.log("Spinner displayed.");
   # });
  ###
  show : s.promiseF "show", (text, options = {}) ->
    params =
      text : text
      # KLUDGE: hardcoded to "app" instead of defaulting to "webview".
      # Android does not support locking down an individual webview.
      target : "app"
      animated : options?.animated || true

    new Promise (resolve, reject) ->
      steroids.spinner.show params,
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.dialog.spinner
   # @name hide
   # @function
   # @apiCall supersonic.ui.dialog.spinner.hide
   # @description
   # Hide the native spinner dialog.
   # @type
   # supersonic.ui.dialog.spinner.hide : (
   #   options?: {
   #     animated?: Boolean
   #     delay?: Number
   #   }
   # ) => Promise
   # @define {Object} options={} An optional options object.
   # @define {String} options.animated=true Optional turn on and off the animation when hidding the spinner.
   # @define {String} options.delay=0.5 Optional define a delay in seconds before the spinner is hidden.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/), resolved when the spinner is hidden.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # options =
   #   animated: false
   #   delay?: 0.6
   # supersonic.ui.dialog.spinner.hide(options).then ->
   #   supersonic.logger.log "Spinner is gone."
   #
   # @exampleJavaScript
   # var options = {
   #   animated: false,
   #   delay?: 0.6
   # };
   #
   # supersonic.ui.dialog.spinner.hide(options).then(function() {
   #   supersonic.logger.log("Spinner is gone.");
   # });
  ###
  hide : s.promiseF "hide", (options = {}) ->
    params =
      delay : options?.delay || 0
      # KLUDGE: hardcoded to "app" instead of defaulting to "webview".
      # Android does not support locking down an individual webview.
      target : "app"
      animated : options?.animated || true

    new Promise (resolve, reject) ->
      steroids.spinner.hide params,
        onSuccess: resolve
        onFailure: reject
