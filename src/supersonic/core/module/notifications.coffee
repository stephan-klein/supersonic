Promise = require 'bluebird'
merge = require 'lodash/object/merge'

APPGYVER_NOTIFICATION_RESOURCE_NAME = 'AppGyverNotification'

module.exports = (data, attributes, auth) ->

  createAnnouncer = (namespace, events, defaults, resourceName) ->
    announcer = {}

    maybeModel = try
        data.model resourceName
      catch e
        null

    for eventName in events
      eventType = "#{namespace}:#{eventName}"
      announcer[eventName] = eventAnnouncer eventType, defaults, maybeModel

    announcer

  eventAnnouncer = (eventType, defaults, maybeModel) ->

    alwaysRejectWith = (message) -> ->
      return Promise.reject new Error message

    createNotificationEventWithModel = (model) -> (message, options = {}) ->
      if !message
        return Promise.reject new Error "A message is required"

      Promise.try ->

        eventData = {
          created_at: (new Date).toJSON()
          type: eventType
          target_user_ids: options.receivers ? []
          message
        }

        eventData = merge eventData, (getRouteProperties (options.route || {}), defaults)

        if options.related?
          eventData = merge eventData, getRelatedRecordProperties options.related

        model.create merge defaults, eventData

    announceEvent = switch
      when !maybeModel?
        alwaysRejectWith "Unable to send out notification: this application is not configured with the notification resource."
      else
        model = maybeModel
        createNotificationEventWithModel model


  getRelatedRecordProperties = (related) ->
    relatedRecordProperties = {}

    if related.id?
      relatedRecordProperties.related_record_id = related.id

    if related.type?
      relatedRecordProperties.related_record_type = related.type

    relatedRecordProperties

  getRouteProperties = (explicitRoute, defaults) ->
    routeProperties = {}

    routeProperties.route = switch
      when explicitRoute.view?
        explicitRoute.view
      when defaults.record_type? and defaults.record_id?
        "data.#{defaults.record_type}.show"
      when defaults.record_type?
        "data.#{defaults.record_type}"
      else
        throw new Error "Missing route.view: must be either explicit or determined by attributes"

    routeProperties.route_params = switch
      when explicitRoute.params?
        explicitRoute.params
      when defaults.record_id?
        id: defaults.record_id
      else
        {}

    routeProperties

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
      resourceName = options.resourceName ? APPGYVER_NOTIFICATION_RESOURCE_NAME

      createAnnouncer namespace, events, defaults, resourceName
  }
