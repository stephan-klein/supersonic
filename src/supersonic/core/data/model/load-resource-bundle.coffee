data = require 'ag-data'

defaultPollBehavior = require './default-poll-behavior'

DEFAULT_BACKEND_POLL_INTERVAL_MILLISECONDS = 10000
DEFAULT_CACHE_POLL_INTERVAL_MILLISECONDS = 1000

module.exports = (logger, session, getDefaultCacheStorage) ->

  withDefaults = (name, options) ->
    if options.cache?.enabled != false
      options.cache ?= {}
      options.cache.enabled = true

    if options.cache.enabled
      unless options.cache.storage?
        options.cache.storage = getDefaultCacheStorage()

    if not options.headers?.Authorization?
      options.headers ?= {}
      options.headers.Authorization = session.getAccessToken()

    options.followable ?= {
      poll: defaultPollBehavior name
      interval: switch options.cache.enabled
        when true then DEFAULT_CACHE_POLL_INTERVAL_MILLISECONDS
        else DEFAULT_BACKEND_POLL_INTERVAL_MILLISECONDS
    }

    options

  return loadResourceBundle = (bundleDefinition) ->
    bundle = data.loadResourceBundle bundleDefinition

    createModel: (name, options = {}) ->
      options = withDefaults(name, options)

      try
        bundle.createModel name, options
      catch err
        logger.error "Tried to access cloud resource '#{name}', but it is not a configured resource"
        throw new Error "Could not load model #{name}: #{err}"
