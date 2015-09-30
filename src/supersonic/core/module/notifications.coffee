Promise = require 'bluebird'

APPGYVER_NOTIFICATION_RESOURCE_NAME = 'AppGyverNotification'

module.exports = (data, attributes) ->

  createAnnouncer = (namespace, events, context) ->
    announcer = {}

    for eventName in events
      announcer[eventName] = eventAnnouncer namespace, eventName, context

    announcer

  eventAnnouncer = (namespace, eventName, context) ->
    announceEvent = (message) ->
      if !message
        return Promise.reject new Error "A message is required"

      model = data.model APPGYVER_NOTIFICATION_RESOURCE_NAME

      model.create {
        record_id: context.id if context.id?
        record_type: context.type if context.type?
        type: "#{namespace}:#{eventName}"
        message
      }

  guessContext = (attributes) ->
    recordType = attributes.get 'record-type'
    recordId = attributes.get 'record-id'

    switch
      when !recordType
        {}
      when !recordId
        type: recordType
      else
        type: recordType
        id: recordId

  {
    announcer: (namespace, options = {}) ->
      if !namespace
        throw new Error "Module namespace is required"

      events = options.events ? []

      if !events.length
        throw new Error "A list of event names is required"

      createAnnouncer namespace, events, (guessContext attributes)
  }
