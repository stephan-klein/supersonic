Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log) ->
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
   # Get a new view instance by a view identifier. Identifiers can be custom IDs, routes, or URLs.
   # @type
   # supersonic.ui.views.find: (
   #  id: String
   # ) => Promise view: View
   # @define {String} id A string matching the identifier of a view.
   # @returnsDescription
   # [Promise](todo) that resolves with a View instance representing the given identifier
   # @define {View} view A new View instance matching the identifier given as a parameter.
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

        resolve new View viewOrId

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
   # ) => Promise view: View
   # @define {View|String} view The View that will be started in the background. Alternatively, you can directly pass a identifier string.
   # @returnsDescription
   # [Promise] that resolves with the given View object. If the view identifier is already in use by another started View, the promise will be rejected.
   # @usageCoffeeScript
   # supersonic.ui.views.start "cars#show"
   # @usageJavaScript
   # supersonic.ui.views.start("cars#show");
   # @exampleCoffeeScript
   # # With shorthand
   # supersonic.ui.views.start("cars#show").then (carsShowView) ->
   #   # The id is "cars#show"
   #   supersonic.logger.log "carsShowView id: #{carsShowView.getId()}"
   #
   # # With View object
   # view = supersonic.ui.views.find("cars#edit")
   # supersonic.ui.views.start("cars#edit").then (carsEditView) ->
   #   # The id is "cars#edit"
   #   supersonic.logger.log "carsEditView id: #{carsEditView.getId()}"
   #
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
   # Stop a View running in the background. It will be destroyed and any memory used freed. A View that is in use(e.g. in the [navigation stack](/ui-and-navigation/navigation/navigation-stack/)) cannot be stopped.
   # @type
   # supersonic.ui.views.stop: (
   #  view: View|String
   # ) => Promise
   # @define {View|String} view The View that will be started in the background. Alternatively, you can directly pass a identifier string.
   # @returnsDescription
   # [Promise](todo) that resolves after the View has been stopped.
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
    supersonic.ui.views.find(viewOrId)
    .then (view)->
      view.stop()

  {
    find: find
    start: start
    stop: stop
    current: require('./views/current')(log)
  }
