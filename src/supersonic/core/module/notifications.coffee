Promise = require 'bluebird'

APPGYVER_NOTIFICATION_RESOURCE_NAME = 'AppGyverNotification'

module.exports = (data) ->

  createAnnouncer = (namespace, events) ->
    announcer = {}

    for eventName in events
      announcer[eventName] = eventAnnouncer namespace, eventName

    announcer

  eventAnnouncer = (namespace, eventName) ->
    announceEvent = (message) ->
      if !message
        return Promise.reject new Error "A message is required"

      model = data.model APPGYVER_NOTIFICATION_RESOURCE_NAME

      model.create {
        type: "#{namespace}:#{eventName}"
        message
      }

  {
    announcer: (namespace, options = {}) ->
      if !namespace
        throw new Error "Module namespace is required"

      events = options.events ? []

      if !events.length
        throw new Error "A list of event names is required"

      createAnnouncer namespace, events
  }
