Promise = require 'bluebird'
merge = require 'lodash/object/merge'

APPGYVER_NOTIFICATION_RESOURCE_NAME = 'AppGyverNotification'

module.exports = (data, attributes, auth) ->

  createAnnouncer = (namespace, events, defaults) ->
    announcer = {}

    for eventName in events
      announcer[eventName] = eventAnnouncer namespace, eventName, defaults

    announcer

  eventAnnouncer = (namespace, eventName, defaults) ->
    announceEvent = (message) ->
      if !message
        return Promise.reject new Error "A message is required"

      model = data.model APPGYVER_NOTIFICATION_RESOURCE_NAME

      model.create merge defaults, {
        type: "#{namespace}:#{eventName}"
        message
      }

  makeDefaults = (context, session) ->
    defaults = {}
    defaults.record_id = context.id if context.id?
    defaults.record_type = context.type if context.type?

    if userId = session.getUserId()
      defaults.owner_user_id = userId

    defaults

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

      context = guessContext attributes
      defaults = makeDefaults context, auth.session
      createAnnouncer namespace, events, defaults
  }
