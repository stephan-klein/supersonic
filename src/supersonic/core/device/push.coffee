Promise = require 'bluebird'
Bacon = require 'baconjs'

{deviceready} = require '../events'

superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.device.push', log

  ###
   # @namespace supersonic.device
   # @name push
   # @overview
   # @description
   # Provides access to Push Notification services.
  ###

  getPlugin = ->
    deviceready.then(->
      window.plugins?.pushNotification
    ).then (plugin) ->
      if !plugin?
        throw new Error "Could not load pushNotification plugin. Is the plugin installed?"
      plugin

  ###
   # @namespace supersonic.device.push
   # @name register
   # @function
   # @apiCall supersonic.device.push.register
   # @type
   # supersonic.device.push.register : (
   #   options?: {
   #     senderID?: String
   #     badge?: "true" | "false"
   #     sound?: "true" | "false"
   #     alert?: "true" | "false"
   #   }
   # ) => Promise devicetoken: String
   # @define {Object} options={} Optional options object.
   # @define {String} senderID (Android specific)
   # @define {String} badge (iOS specific)
   # @define {String} sound (iOS specific)
   # @define {String} alert (iOS specific)
   # @supportsCallbacks
  ###
  register = s.promiseF "register", (options = {}) ->
    getPlugin().then (plugin) ->
      new Promise((resolve, reject) ->
        plugin.register(resolve, reject, options)
      ).tap (devicetoken) ->
        log.info "Registered device to receive push notifications with device token / registration id: '#{devicetoken}'"

  ###
   # @namespace supersonic.device.push
   # @name unregister
   # @function
   # @apiCall supersonic.device.push.unregister
   # @type
   # supersonic.device.push.unregister: () => Promise
   # @supportsCallbacks
  ###
  unregister = s.promiseF "unregister", ->
    getPlugin().then (plugin) ->
      new Promise (resolve, reject) ->
        plugin.unregister(resolve, reject)

  ###
   # @namespace supersonic.device.push
   # @name backgroundNotifications
   # @function
   # @apiCall supersonic.device.push.backgroundNotifications
   # @type
   # supersonic.device.push.backgroundNotifications: () => Stream {
   #   message?: String
   #   alert?: String
   # }
   # @supportsCallbacks
  ###
  backgroundNotifications = s.streamF "backgroundNotifications", ->
    Bacon
      .fromPromise(getPlugin())
      .flatMap (plugin) ->
        Bacon.fromBinder (sink) ->
          plugin.onMessageInBackground(
            (notification) -> sink new Bacon.Next notification
            (error) -> sink new Bacon.Error error
          )
          ->
            # Can't unsubscribe

  ###
   # @namespace supersonic.device.push
   # @name foregroundNotifications
   # @function
   # @apiCall supersonic.device.push.foregroundNotifications
   # @type
   # supersonic.device.push.foregroundNotifications: () => Stream {
   #   message?: String
   #   alert?: String
   # }
   # @supportsCallbacks
  ###
  foregroundNotifications = s.streamF "foregroundNotifications", ->
    Bacon
      .fromPromise(getPlugin())
      .flatMap (plugin) ->
        Bacon.fromBinder (sink) ->
          plugin.onMessageInForeground(
            (notification) -> sink new Bacon.Next notification
            (error) -> sink new Bacon.Error error
          )
          ->
            # Can't unsubscribe

  {
    register
    unregister
    backgroundNotifications
    foregroundNotifications
  }



