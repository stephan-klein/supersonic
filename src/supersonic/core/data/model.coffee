Bacon = require 'baconjs'
data = require 'ag-data'

module.exports = (logger, window) ->
  # Connect ag-data to a resource bundle from window.ag.data such that errors
  # are correctly wrapped and logged. Notably, if window.ag.data exists but
  # does not define a valid bundle, an error will be logged without interaction.
  ###
   # @namespace supersonic.data
   # @name model
   # @function
   # @apiCall supersonic.data.model
   # @description
   # Provides access to Supersonic Data cloud resources. The function returns a Model class that represents the given resource.
   # @type
   # model: (
   #   name: String
   # ) => Model
   # @define {String} name The name of a configured cloud resource
   # @returnsDescription
   # Returns a Model class that represents the given resoruce, e.g. `supersonic.data.model("car")` returns a Car Model class.
   # @exampleCoffeeScript
   # Task = supersonic.data.model 'task'
   # takeOutTheTrash = new Task {
   #   description: "Take out the trash"
   # }
   # takeOutTheTrash.save()
   # @exampleJavaScript
   # var Task = supersonic.data.model('task');
   # takeOutTheTrash = new Task({
   #   description: "Take out the trash"
   # });
   # takeOutTheTrash.save();
  ###
  createModel = switch
    when window?.ag?.data?
      try
        bundle = data.loadResourceBundle(window.ag.data)
        (name) ->
          try
            bundle.createModel name
          catch err
            logger.error "Tried to access cloud resource '#{name}', but it is not a configured resource"
            throw new Error "Could not load model #{name}: #{err}"
      catch err
        logger.error "Tried to access a cloud resource, but the configured cloud resource bundle could not be loaded"
        ->
          throw new Error "Could not load configured cloud resource bundle: #{err}"
    else (name) ->
      logger.error "Tried to access a cloud resource, but no resources have been configured"
      throw new Error "No cloud resources available"

###
# @namespace supersonic.data
# @name Model
# @class
# @description
# A Supersonic Data Model class. Provides access to a specific cloud resource.
# @type
# supersonic.data.Model: {
#   all: (queryParams, options) => Object
#   findAll: (queryParams) => Promise Collection
#   find: (id) => Promise Model
# }
# @methods all find findAll
# @define {Function} all Retuns an object with properties for accessing a stream of updates to the Collection data.
# @define {Function} findAll Returns a [`Promise`](/supersonic/guides/technical-concepts/promises/) that resolves to a Collection of Model instances, representing the matching resources in the backend.
# @define {Function} find Returns a [`Promise`](/supersonic/guides/technical-concepts/promises/) that resolves to a Model instance representing the cloud resource with the given id.
###
###
# @namespace supersonic.data
# @name Model.all
# @function
# @type
# all: (
#   queryParams?: Object
#   options?:
#      interval?: Integer
# ) =>
#   whenChanged: (Collection) =>
#     unsubscribe: Function
# @description
# Find and fetch a Collection of Model instances that matches the query parameters given to the function. The results of the query are made available as a stream that gets updated with the latest data every `interval` ms.
# @define {Object} queryParams An object...
# @define {Object} options An optional options object.
# @define {Integer} options.interval=1000 An integer defining how often the backend is polled for new data, in ms.
# @returnsDescription
# An object with the `whenChanged` property, which accepts a recurring callback function that gets triggered when new data is available.
# @define {=>Function} whenChanged Called with a Collection matching the original query. Called when new data is available. Returns a function that can be used to unsubsribe from the update stream.
# @define {=>Function} whenChanged.unsubscribe Call this function to stop listening for data changes.
# @exampleCoffeeScript
# unsubscribe = supersonic.data.model('task').all(queryParameters, options).whenChanged (updatedTasks)->
#   supersonic.logger.log "First element of updated Task collection: ", updatedTasks[0]
# @exampleJavaScript
# var unsubscribe = supersonic.data.model('task').all(queryParameters, options).whenChanged( function(updatedTasks) {
#   supersonic.logger.log("First element of updated Task collection: ", updatedTasks[0]);
# });
#
# // Later on, we can unsusbcribe the listener
# unsubscribe();
###

###
 # @namespace supersonic.data
 # @name Model.findAll
 # @function
 # @type
 # findAll: () => Promise collection: Collection Model
 # @description
 # Access all cloud resources matching the Model class.
 # @returnsDescription
 # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that resolves with a Collection of Model instances, each of whom represents a single cloud resource.
 # @define {=>Collection Model} collection A Collection that contains Model instances for all the cloud resources matching the Model class.
 # @exampleCoffeeScript
 # supersonic.data.model('task').findAll().then (tasks) ->
 #   for task in tasks
 #      console.log task.description
 # @exampleJavaScript
 # supersonic.data.model('task').findAll().then( function(tasks) {
 #   for (var i = 0; i < tasks.length; i++) {
 #     console.log(tasks[i].description);
 #   }
 # });
###
###
 # @namespace supersonic.data
 # @name Model.find
 # @function
 # @type
 # find: (id: String) => Promise model instance
 # @description
 # Find a resource from the cloud by an id and return a Model instance representing that resource.
 # @define {String} id An id string matching a cloud resource.
 # @returnsDescription
 # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that gets resolved with a Model instance representing the resource matching the id.
 # @exampleCoffeeScript
 # supersonic.data.model('task').find(123).then (task) ->
 #   console.log task.description
 # @exampleJavaScript
 # supersonic.data.model('task').find(123).then( function(task) {
 #   console.log(task.description);
 # });
###
###
 # @namespace supersonic.data
 # @name Collection
 # @class
 # @description
 # A Supersonic Data Collection class. Represents a collection of resources (instances of `supersonic.data.model`) fetched from the cloud backend.
 # @type
 # Collection: {
 #   save: () => Promise
 # }
 # @methods save
 # @define {Function} save Persist all the Model instances in this collection.
###
###
 # @namespace supersonic.data
 # @name Collection.save
 # @function
 # @type
 # Collection.save: () => Promise
 # @description
 # Persist all model instances in this collection.
 # @returnDescription
 # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that resolves once all the model instances in the collection have been perisisted to the cloud backend.
 # @exampleCoffeeScript
 # supersonic.data.model('task').findAll().then (tasks) ->
 #   for task in tasks
 #     task.completed = true
 #   tasks.save().then ->
 #     supersonic.logger.log "All tasks saved!"
 # @exampleJavaScript
 # supersonic.data.model('task').findAll().then( function(tasks) {
 #   for (var i = 0; i < tasks.length; i++) {
 #     tasks[i].completed = true;
 #   }
 #   tasks.save().then( function() {
 #     supersonic.logger.log("All tasks saved!");
 #   });
 # });
###
###
 # @namespace supersonic.data
 # @name Model-instance
 # @instance
 # @description
 # A Supersonic Data Model instance. Represents a single resource fetched from the cloud backend.
 # @type
 # Model: {
 #   save: () => Promise
 #   delete: () => Promise
 # }
 # @methods save delete
 # @define {Function} save Persist the data in this Model instance to the cloud backend.
 # @define {Function} delete Remove this Model instance from the cloud backend.
###
###
 # @namespace supersonic.data
 # @name Model.save
 # @function
 # @type
 # model.save: () => Promise
 # @description
 # Persist the data in this Model instance to the cloud. If the instance is new, create it in the cloud; otherwise update the existing cloud resource.
 # @exampleCoffeeScript
 # supersonic.data.model('task').find(123).then (task) ->
 #   task.done = true
 #   task.save()
 # @exampleJavaScript
 # supersonic.data.model('task').find(123).then( function(task) {
 #   task.done = true;
 #   task.save();
 # });
 # @returnsDescription
 # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that gets resolved once the Model instance has been persisted to the cloud backend.
###
###
 # @namespace supersonic.data
 # @name Model.delete
 # @function
 # @type
 # model.delete: () => Promise
 # @description
 # Remove the resource matching this model instance from the cloud backend.
 # @exampleCoffeeScript
 # supersonic.data.model('task').find(123).then (task) ->
 #   if task.done
 #     task.delete()
 # @exampleJavaScript
 # supersonic.data.model('task').find(123).then( function(task) {
 #   if (task.done) {
 #     task.delete();
 #   }
 # });
 # @returnsDescription
 # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that gets resolved once the Model instance has been deleted from the cloud backend.
###
