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

    constructor: (@options={})->
      @options.location = parseRoute(@options.location)
      @_webView = new steroids.views.WebView @options

    isStarted: ->
      new Promise (resolve, reject) =>
        getApplicationState.then (state)=>
          ids = (id for id in state.preloads)
          if @id in ids
            resolve true
          else
            resolve false

    getId: ->
      _webView.id

    setId: (newId)->
      new Promise (resolve, reject) =>
        isStarted.then (started)->
          unless started
            @_webView.id = newId
            resolve(newId)
          else
            reject new Error "Cannot change View identifier after it has been started. Stop the View first and then change the identifier."

    getLocation: ->
      _webView.location

    start: ->
      new Promise (resolve, reject) =>
        _webView.preload {},
          onSuccess: -> resolve view
          onFailure: reject #TODO

    stop: ->
      new Promise (resolve, reject) =>
        _webView.unload {},
          onSuccess: -> resolve view
          onFailure: reject #TODO

    on: (event, callback)->
      new Promise (resolve, reject) =>
        try
          handlerId = _webView.on(event, callback)
          resolve(handlerId)
        catch e
          reject e

    off: (event, eventHandlerId)->
      new Promise (resolve, reject) =>
        try
          _webView.off(event, eventHandlerId)
          resolve()
        catch e
          reject e

  return View
