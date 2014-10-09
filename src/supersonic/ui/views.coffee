Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.ui.views"

  ###
   # @category core
   # @module ui
   # @name views
   # @overview
   # @description
   # The `supersonic.ui.views` namespace contains funcitons for manipulating and accessing View objects.
  ###

  ###
   # @module ui
   # @name find
   # @function
   # @apiCall supersonic.ui.views.find
   # @description
   # Get a started (or persistent) view by its ID.
   # @type
   # supersonic.ui.views.find: (
   #  id: String
   # ) => Promise startedView: StartedView
   # @define {String} id A string matching the ID of a started view.
   # @returnsDescription
   # [Promise](todo) that resolves with a StartedView object if the find operation was successful, or rejects if the given id didn't match any started views.
   # @define {StartedView} startedView The StartedView object matching the id given as a parameter.
   # @usageCoffeeScript
   # supersonic.ui.views.find("myCarsView").then (startedView) ->
   #   supersonic.logger.log "myCarsView location: #{startedView.getLocation()}"
   # @exampleCoffeeScript
   # supersonic.ui.views.find("myCarsView").then (startedView) ->
   #   supersonic.logger.log "myCarsView location: #{startedView.getLocation()}"
  ###

  find = (id) ->
    isStarted(id).then ->
      createStartedView(id)

  ###
   # @module ui
   # @name start
   # @function
   # @apiCall supersonic.ui.views.start
   # @description
   # Start a View in the background, allowing it to remain running even when not in the layer stack.
   # @type
   # supersonic.ui.views.start: (
   #  view: View|String
   #  id?: String
   # ) => Promise startedView: StartedView
   # @define {View|String} view The View that will be started in the background. Alternatively, you can directly pass a location string.
   # @define {String} id=view.location The id that will be used to access the started view. If no id is given, the location string of the View to start will be used as the id.
   # @returnsDescription
   # [Promise](todo) that resolves with a StartedView object. If the id is already in use by another StartedView, the promise will be rejected.
   # @define {StartedView} startedView The StartedView object referencing the View running in the background.
   # @usageCoffeeScript
   # supersonic.ui.views.start "cars#show"
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
  ###

  start = (view, id) ->
    new Promise (resolve, reject) ->
      betterView = if view.constructor.name is "String"
        supersonic.ui.view(view)
      else
        view

      isStarted(id).then( ->
        error =
          errorDescription: "A view with id #{id} is already started."
        reject error
      ).catch ->
        betterView._getWebView().preload {id: id}, {
          onSuccess: ->
            resolve createStartedView(id)
          onFailure: (error)->
            reject error
        }

  ###
   # @module ui
   # @name stop
   # @function
   # @apiCall supersonic.ui.views.stop
   # @description
   # Stop a StartedView running in the background. It will be destroyed and any memory used freed.
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
   # @exampleCoffeeScript
   # supersonic.ui.views.stop "carsShowView"
  ###

  stop = (id) ->
    new Promise (resolve, reject) ->
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
    ###
     # @module ui
     # @name StartedView
     # @class
     # @description
     # Pointer to a started Supersonic View. A StartedView points to a specific stared
     # @type
     # View: {
     #   getId: () => String
     # }
     # @define {Function} getId Returns the ID of the the StartedView.
    ###
    {
      getId: -> id
    }

  isStarted = (id) ->
    new Promise (resolve, reject) ->
      testView = new steroids.views.WebView
        location: "null"
        id: id

      testView.preload {}, {
        onSuccess: ->
          # View with that ID didn't exist, so unload immediately.
          testView.unload {}, {
            onSuccess: ->
              reject()
          }
        onFailure: (error) ->
          if error.errorDescription is "A preloaded layer with this identifier already exists"
            resolve()
          else
            reject()
      }

  {
    find: find
    start: start
    stop: stop
  }
