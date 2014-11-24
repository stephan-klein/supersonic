Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log, global) ->
  View = require("./View")(steroids, log)
  s = superify 'supersonic.ui.views', log

  ###
   # @namespace supersonic.ui
   # @name views
   # @overview
   # @description
   # The `supersonic.ui.views` namespace contains functions for manipulating and accessing View objects.
  ###

  getApplicationState = ->
    new Promise (resolve, reject) ->
      steroids.getApplicationState {},
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.views
   # @name find
   # @function
   # @apiCall supersonic.ui.views.find
   # @description
   # Get a new view instance by a view identifier.
   # @type
   # supersonic.ui.views.find: (
   #  id: String
   # ) => Promise view: View
   # @define {String} id A string matching the identifier of a view.
   # @returnsDescription
   # A [Promise](/supersonic/guides/technical-concepts/promises/) that resolves with a View instance representing the given identifier.
   # @define {View} view A new View instance matching the identifier given as a parameter.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.views.find("myCarsView").then (startedView) ->
   #   supersonic.logger.log "myCarsView location: #{startedView.getLocation()}"
   # @exampleJavaScript
   # supersonic.ui.views.find("myCarsView").then( function(startedView) {
   #   supersonic.logger.log("myCarsView location: " + startedView.getLocation());
   # });
  ###
  find = s.promiseF "find", (viewOrId)->
    new Promise (resolve, reject) ->
      if viewOrId.constructor.name is "View"
        resolve viewOrId
        return

      getApplicationState().then (state)->
        for preload in state.preloads
          if preload.id == viewOrId
            resolve new View
              id: preload.id
              location: preload.startURL
            return

        resolve new View
          location: viewOrId
          id: viewOrId

  ###
   # @namespace supersonic.ui.views
   # @name start
   # @function
   # @apiCall supersonic.ui.views.start
   # @description
   # Start a View in the background, allowing it to remain running even when it's not in a navigation stack or used in a drawer.
   #  view: View|String
   # ) => Promise view: View
   # @define {View|String} view The View that will be started in the background. Alternatively, you can directly pass an identifier string.
   # @returnsDescription
   #  A [Promise](/supersonic/guides/technical-concepts/promises/) that resolves with the given View object. If the view identifier is already in use by another started View, the promise will be rejected.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # # With shorthand
   # supersonic.ui.views.start("cars#show").then (carsShowView) ->
   #   # The id is "cars#show"
   #   supersonic.logger.log "carsShowView id: #{carsShowView.getId()}"
   #
   # # With View object
   # view = new supersonic.ui.View
   #   location: "cars#edit"
   #   id: "carsEdit"
   #
   # supersonic.ui.views.start(view).then (carsEditView) ->
   #   # The id is "carsEdit"
   #   supersonic.logger.log "carsEditView id: #{carsEditView.getId()}"
   #   supersonic.layers.push carsEditView
   #
   # @exampleJavaScript
   # // With shorthand
   # supersonic.ui.views.start("cars#show").then( function(carsShowView) {
   #   // The id is "cars#show"
   #   supersonic.logger.log("carsShowView id: " + carsShowView.getId());
   # });
   #
   # // With View object
   # var view = new supersonic.ui.View({
   #   location: "cars#edit",
   #   id: "carsEdit"
   # });
   #
   # supersonic.ui.views.start(view).then( function(carsEditView) {
   #   // The id is "carsEdit"
   #   supersonic.logger.log("carsEditView id: " + carsEditView.getId());
   #   supersonic.layers.push carsEditView
   # });
  ###
  start =  s.promiseF "start", (viewOrId)->
    supersonic.ui.views.find(viewOrId)
    .then (view)->
      view.start()

  ###
   # @namespace supersonic.ui.views
   # @name stop
   # @function
   # @apiCall supersonic.ui.views.stop
   # @description
   # Stop a View running in the background. It will be destroyed and any memory used freed. A View that is in use (e.g. in the navigation stack) cannot be stopped.
   # @type
   # supersonic.ui.views.stop: (
   #  viewOrId: View|String
   # ) => Promise
   # @define {View|String} viewOrId The View that will be stopped. Alternatively, you can directly pass an identifier string.
   # @returnsDescription
   # A [Promise](/supersonic/guides/technical-concepts/promises/) that resolves after the View has been stopped. If the View or identifier doesn't match a started View, the promise will be rejected.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.views.stop("carsShowView").then ->
   #   supersonic.logger.log "View was successfully stopped!"
   # @exampleJavaScript
   # supersonic.ui.views.stop("carsShowView").then( function() {
   #   supersonic.logger.log("View was succesfully stopped!");
   # });
  ###
  stop = s.promiseF "stop", (viewOrId) ->
    supersonic.ui.views.find(viewOrId)
    .then (view)->
      view.stop()

  {
    find: find
    start: start
    stop: stop
    current: require('./views/current')(steroids, log, global)
  }
