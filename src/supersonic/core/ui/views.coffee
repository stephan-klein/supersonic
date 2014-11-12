Promise = require 'bluebird'
current = require './views/current'
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.views', log

  ###
   # @namespace supersonic.ui
   # @name views
   # @overview
   # @description
   # The `supersonic.ui.views` namespace contains functions for manipulating and accessing View objects.
  ###

  ###
   # @namespace supersonic.ui.views
   # @name find
   # @function
   # @apiCall supersonic.ui.views.find
   # @description
   # Get a [started](/ui-and-navigation/views/started-views/) (or [persistent](/ui-and-navigation/views/persistent-views/)) view by its id.
   # @type
   # supersonic.ui.views.find: (
   #  id: String
   # ) => Promise startedView: StartedView
   # @define {String} id A string matching the id of a started view.
   # @returnsDescription
   # [Promise](todo) that resolves with a StartedView object if the find operation was successful, or rejects if the given id didn't match any started views.
   # @define {StartedView} startedView The StartedView object matching the id given as a parameter.
   # @usageCoffeeScript
   # supersonic.ui.views.find("myCarsView").then (startedView) ->
   #   supersonic.logger.log "myCarsView location: #{startedView.getLocation()}"
   # @usageJavaScript
   # supersonic.ui.views.find("myCarsView").then( function(startedView) {
   #   supersonic.logger.log("myCarsView location: " + startedView.getLocation());
   # });
   # @exampleCoffeeScript
   # supersonic.ui.views.find("myCarsView").then (startedView) ->
   #   supersonic.logger.log "myCarsView location: #{startedView.getLocation()}"
   # @exampleJavaScript
   # supersonic.ui.views.find("myCarsView").then( function(startedView) {
   #   supersonic.logger.log("myCarsView location: " + startedView.getLocation());
   # });
  ###
  find = s.promiseF "find", (id) ->
    supersonic.logger.debug "Finding view with id #{id}"
    isStartedView(id).then (started) ->
      unless started
        throw new Error "There was no started view by id '#{id}'"
      createStartedView(id)

  ###
   # @namespace supersonic.ui.views
   # @name start
   # @function
   # @apiCall supersonic.ui.views.start
   # @description
   # Start a View in the background, allowing it to remain running even when it's not in a navigation stack or used in a drawer. Read more in the [Started Views guide](/ui-and-navigation/views/started-views/).
   # @type
   # supersonic.ui.views.start: (
   #  view: View|String
   #  id: String
   # ) => Promise startedView: StartedView
   # @define {View|String} view The View that will be started in the background. Alternatively, you can directly pass a location string.
   # @define {String} id The id that will be used to access the StartedView. Cannot contain the `#` character.
   # @returnsDescription
   # [Promise](todo) that resolves with a StartedView object. If the id is already in use by another StartedView, the promise will be rejected.
   # @define {StartedView} startedView The StartedView object referencing the View running in the background.
   # @usageCoffeeScript
   # supersonic.ui.views.start "cars#show"
   # @usageJavaScript
   # supersonic.ui.views.start("cars#show");
   # @exampleCoffeeScript
   # # With shorthand
   # supersonic.ui.views.start("cars#show", "carsShowView").then (carsShowView) ->
   #   supersonic.logger.log "carsShowView id: #{carsShowView.getId()}"
   #
   # # With View object
   # view = supersonic.ui.views("cars#edit")
   # supersonic.ui.views.start("cars#edit", "carsEditView").then (carsEditView) ->
   #   supersonic.logger.log "carsEditView id: #{carsEditView.getId()}"
   #
   # # The second id param is optional
   # supersonic.ui.views.start("bananas#index").then (bananasIndex) ->
   #   # The id is "bananas#index"
   #   supersonic.logger.log "bananasIndex id: #{bananasIndex.getId()}"
   # @exampleJavaScript
   # // With shorthand
   # supersonic.ui.views.start("cars#show", "carsShowView").then( function(carsShowView) {
   #   supersonic.logger.log("carsShowView id: " + carsShowView.getId());
   # });
   #
   # // With View object
   # var view = supersonic.ui.views("cars#edit");
   # supersonic.ui.views.start("cars#edit", "carsEditView").then( function(carsEditView) {
   #   supersonic.logger.log("carsEditView id: " + carsEditView.getId());
   # });
   #
   # // The second id param is optional
   # supersonic.ui.views.start("bananas#index").then( function(bananasIndex) {
   #   // The id is "bananas#index"
   #   supersonic.logger.log("bananasIndex id: " + bananasIndex.getId());
   # });
  ###

  start = s.promiseF "start", (view, id) ->
    isStartedView(id).then (started) ->
      if started
        throw new Error "A view with id #{id} is already started."

      betterView = if view.constructor.name is "String"
        supersonic.ui.view(view)
      else
        view

      new Promise (resolve, reject) ->
        betterView._getWebView().preload {id: id}, {
          onSuccess: ->
            resolve createStartedView(id)
          onFailure: (error)->
            reject error
        }

  ###
   # @namespace supersonic.ui.views
   # @name stop
   # @function
   # @apiCall supersonic.ui.views.stop
   # @description
   # Stop a StartedView running in the background. It will be destroyed and any memory used freed. A StartedView that is in the [navigation stack](/ui-and-navigation/navigation/navigation-stack/) cannot be stopped.
   # @type
   # supersonic.ui.views.stop: (
   #  id: String
   # ) => Promise
   # @define {View|String} view The View that will be started in the background. Alternatively, you can directly pass a location string.
   # @define {String} id=view.location The id that will be used to access the started view. If no id is given, the location string of the View to start will be used as the id.
   # @returnsDescription
   # [Promise](todo) that resolves after the StartedView matching the id has been stopped. If no StartedView matching the id can be found.
   # @usageCoffeeScript
   # supersonic.ui.views.stop "carsShowView"
   # @usageJavaScript
   # supersonic.ui.views.stop("carsShowView");
   # @exampleCoffeeScript
   # supersonic.ui.views.stop "carsShowView"
   # @exampleJavaScript
   # supersonic.ui.views.stop("carsShowView");
  ###

  stop = s.promiseF "stop", (viewOrId) ->
    new Promise (resolve, reject) ->
      id = if viewOrId.constructor.name is "String"
        viewOrId
      else
        viewOrId.getId()

      viewToUnload = new steroids.views.WebView
        location: "null"
        id: id

      viewToUnload.unload {}, {
        onSuccess: ->
          resolve()
        onFailure: ->
          error =
            errorMsg: "Could not find a StartedView with id #{id} to stop."
          reject()
      }

  createStartedView = (id) ->

    {
      getId: -> id
      stop: -> stop id
      _getWebView: ->
        new steroids.views.WebView
          id: id
          location: ""
    }

  getApplicationState = ->
    new Promise (resolve, reject) ->
      steroids.getApplicationState {}, {
        onSuccess: resolve
        onFailure: reject
      }

  getStartedViews = s.promiseF "getStartedViews", ->
    getApplicationState().then (state) ->
      for preload in state.preloads
        preload.id

  isStartedView = s.promiseF "isStartedView", (id) ->
    if typeof id isnt 'string'
      Promise.reject new Error "Given view id '#{id}' was of type '#{typeof id}', string expected"
    else
      getStartedViews().then (ids) ->
        id in ids

  {
    find: find
    start: start
    stop: stop
    getStartedViews: getStartedViews
    isStartedView: isStartedView
    current: current(log)
  }
