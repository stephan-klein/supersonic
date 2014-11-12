Promise = require 'bluebird'
parseRoute = require './views/parseRoute'

module.exports = (steroids, log) ->
  ###
   # @namespace supersonic.ui
   # @name View
   # @class
   # @description
   # A Supersonic View. A View is a pointer to a specific location (route or URL). A View can be passed as an argument to other API calls (like `supersonic.ui.layers.push`). Read more in the [View guide](/ui-and-navigation/html-views/).
   # @type
   # View: {
   #   getLocation: () => String
   #   start: (String) => StartedView
   # }
   # @define {Function} getLocation Returns the View's location String.
   # @define {Function} start Shorthand for calling `supersonic.ui.views.start(view, id)` with this view.
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
          onFailure: reject #TODO

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
