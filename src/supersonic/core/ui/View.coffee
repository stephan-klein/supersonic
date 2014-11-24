Promise = require 'bluebird'
parseRoute = require './views/parseRoute'

module.exports = (steroids, log) ->
  ###
   # @namespace supersonic.ui
   # @name View
   # @class
   # @description
   # A Supersonic View. At the heart of a View instance is its location property: a Supersonic route or an URL that is used to determine which HTML file the View will render when it's pushed to the navigation stack (e.g. with `supersonic.ui.layers.push` or `supersonic.ui.modal.show`).
   #
   # If you just define a location for the View, the target HTML document will start loading only after the View is pushed to the navigation stack. The new View animates onto the screen instantly, but a loading spinner is shown until the DOM is loaded.
   #
   # Alternatively, you can give the View an identifier (a custom string) and **start** it. Started Views are loaded into memory straight away and continue running until they are stopped, regardless of their position in the navigation stack. To unload a started View from memory, you need to use the `stop()` API call.
   #
   # The View constructor accepts either a location string (Supersonic route or URL) or an options object with `location` and (optional) `id` properties.
   # @type
   # View: {
   #   getLocation: () => location: String
   #   getId: () => id: String
   #   isStarted: () => Promise => isStarted: Boolean
   #   setId: (id: String) => Promise => newId: String
   #   start: (newId?: String) => Promise
   #   stop: () => Promise
   # }
   # @define {Function} getLocation Returns the View's location as a string.
   # @define {Function} getId Returns the View's identifier as a string. An identifier is used to reference a started View.
   # @define {Function} isStarted Returns a promise that resolves to `true` if the View instance's identifier matches a started View. The promise resolves to `false` if the View doesn't have an identifier, or if a matching started View cannot be found.
   # @define {Function} setId Sets the View's identifier. Returns a promise that is resolved with the new identifier. The promise will be rejected if trying to change the identifier of a started View.
   # @define {Function} start Starts the View, causing it load itself into memory and remain active even when not in a navigation stack. Returns a promise that is resolved once the View has been started successfully. The promise will be rejcetd if the view could not be started. Causes for rejection include:
   # <ul>
   #  <li>There already exists a started View with the same identifier as this View instance.</li>
   #  <li>The View has no identifier set and one isn't provided as a parameter to this API call.</li>
   # </ul>
   # @define {Function} stop Stops the View, unloading it from memory. Returns a promise that is resolved once the View has been successfully stopped. A View can only be stopped if its identifier matches an existing started View. The promise is rejected if the View cannot be stopped.
   # @exampleCoffeeScript
   # view = new supersonic.ui.View
   #   location: "cars#edit"
   #   id: "carsEdit"
   # @exampleJavaScript
   # var view = new supersonic.ui.View({
   #   location: "cars#edit",
   #   id: "carsEdit"
   # });
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

      @id = @options.id

      @location = @options.location
      @_webView = new steroids.views.WebView
        location: parseRoute(@location)

    isStarted: ->
      new Promise (resolve, reject) =>
        unless @id?
          resolve false

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
      @location

    start: (newId)->
      new Promise (resolve, reject) =>
        preload = (webView) ->
          webView.preload {},
            onSuccess: ->
              @id = webView.id # mark started
              resolve()
            onFailure: (error)->
              reject new Error error.errorDescription


        if newId?
          @setId(newId).then =>
            preload(@_webView)
        else if not @id
          reject new Error "Cannot start a View without an identifier."
        else
          @_webView.id = @id
          preload(@_webView)

    stop: ->
      new Promise (resolve, reject) =>
        webView = @_webView
        webView.id = @getId()
        webView.unload {},
          onSuccess: =>
            @_webView.id = null
            resolve()
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
