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
   # @name view
   # @function
   # @apiCall supersonic.ui.views.find
   # @description
   # Get a started (or persistent) view by its ID.
   # @type
   # views.find: (
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
    new Promise (resolve, reject) ->
      viewToTest = new steroids.views.WebView
        location: "null"
        id: id

      viewToTest.preload {}, {
        onSuccess: ->
          # View with that ID didn't exist, so unload immediately.
          viewToTest.unload {}, {
            onSuccess: ->
              reject()
          }
        onFailure: ->
          if error.errorDescription is "A preloaded layer with this identifier already exists"
              resolve createStartedView(id)
            else
              reject error
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
     # @define {Function => String} getId Returns the ID of the the StartedView.
    ###
    {
      getId: -> id
    }

  {
    find: find
  }
