Promise = require 'bluebird'
parseRoute = require './views/parseRoute'

module.exports = (steroids, log) ->
  ###
   # @namespace supersonic.ui
   # @name View
   # @class
   # @description
   # A Supersonic View. A View instance references a specific location (a Supersonic route or an URL) or, if the View is started, an unique identifier.
   #
   # A View can be passed as an argument to other API calls (like `supersonic.ui.layers.push`). Some API calls utilize Views internally, like `supersonic.ui.navigate`, which creates a new View instance and then pushes it to the navigation stack.
   # @type
   # supersonic.ui.View: {
   #   getLocation: () => location: String
   #   getId: () => id: String
   #   setId: (id: String) => Promise(newId: String)
   #   isStarted: () => Promise(isStarted: Boolean)
   #   start: (newId?: String) => Promise
   #   stop: () => Promise
   # }
   # @define {Function} getLocation Returns the View's location (as a string).
   # @define {Function} isStarted Returns a promise that resolves to `true` if the View instance references a started view. The promise resolves to `false` if the view doesn't have an `id` property, or if a matching started view cannot be found.
   # @define {Function} getId Returns the View's `id` (as a string), used to reference a started View.
   # @define {Function} setId Sets the View's `id` parameter. Returns a promise that is resolved with the new `id`. If there exists a started view matching the View's current `id`, the Promise is rejected, since the `id` of a started View cannot be changed.
   # @define {Function} start Starts the View. Returns a promise that is resolved once the View has been started successfully. The promise is rejected if the View could not be started, e.g. if there already exists a started View with the same `id`, or if the View instance has no `id` set.<br><br>To start a View, it must have an `id`, set either in the View constructor, via `View.setId()` or as a parameter to this function.
   # @define {Function} stop Stops the View, purging it from memory. Returns a promise that is resolved once the View is successfully stopped. The promise is rejected if the View cannot be stopped. A View can only be stopped if its `id` matches an existing started view.
  ###

  getApplicationState = ->
    new Promise (resolve, reject) ->
      steroids.getApplicationState {},
        onSuccess: resolve
        onFailure: reject

  class View
    _webView: null
    id: null

    constructor: (@options={})->
      if @options.constructor?.name == "String"
        @options =
          location: @options

      unless @options.location
        throw new Error "Cannot initialize a View without any parameters"

      @id = @options.id ? @options.location
      location = parseRoute(@options.location)
      @_webView = new steroids.views.WebView
        id: @options.id
        location: location

    isStarted: ->
      new Promise (resolve, reject) =>
        getApplicationState().then (state)=>
          if @id in (preload.id for preload in state.preloads)
            @_webView.id = @id # mark WebView started
            resolve true
          else
            resolve false

    getId: ->
      @id

    setId: (newId)->
      new Promise (resolve, reject) =>
        @isStarted().then (started)=>
          unless started
            @id = newId
            @_webView.id = newId
            resolve(newId)
          else
            reject new Error "Cannot change View identifier after it has been started. Stop the View first and then change the identifier."

    getLocation: ->
      @_webView.location

    start: (newId)->
      preload = (webView)->
        new Promise (resolve, reject) ->
          webView.preload {},
            onSuccess: ->
              @id = webView.id # mark started
              resolve()
            onFailure: (error)->
              reject new Error error.errorDescription

      if newId?
        @setId(newId).then =>
          preload(@_webView)
      else
        @_webView.id = @id
        preload(@_webView)

    stop: ->
      new Promise (resolve, reject) =>
        @_webView.unload {},
          onSuccess: resolve
          onFailure: (error) ->
            reject new Error error.errorMessage

    on: (event, callback)->
      new Promise (resolve, reject) =>
        try
          handlerId = @_webView.on(event, callback)
          resolve(handlerId)
        catch e
          reject e

    off: (event, eventHandlerId)->
      new Promise (resolve, reject) =>
        try
          @_webView.off(event, eventHandlerId)
          resolve()
        catch e
          reject e

  return View
