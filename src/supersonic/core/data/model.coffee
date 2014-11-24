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
   # Allows access to cloud resources you have configured for your app through Steroids Connect.
   # @type
   # model: (
   #   name: String
   # ) => Model
   # @define {String} name The name of a configured cloud resource
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
# @name model
# @class
# @description
# A Supersonic Data Model class. Provides access to a specific cloud resource through a fluent interface.
# @type
# Model: {
#   all: (queryParams, options) => Object
#   findAll: (queryParams) => Promise Collection
#   find: (id) => Promise model instance
# }
# @methods all find findAll
# @define {Function} all Retuns an object with properties for accessing a stream of updates to the Collection data.
# @define {Function} findAll Returns a collection of model instances representing the matching resources in the backend.
# @define {Function} find Returns a model instance matching a cloud resource with a specific id.
###
###
# @namespace supersonic.data
# @name model.all
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
# Acccess a stream of updates to the Collection data matching the query given to the function
# @define {Object} queryParams An object...
# @define {Object} options An optional options object.
# @define {Integer} options.interval An integer defining how often the backend is polled for new data.
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
 # @name model.findAll
 # @function
 # @type
 # findAll: () => Promise collection: Collection model-instance
 # @description
 # Access a collection of model instances
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
 # @name model.find
 # @function
 # @type
 # find: (id) => Promise model instance
 # @description
 # Find a resource from the cloud by an id and return the matching model instance.
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
 # @define {Function} save Persist all the model instances in this collection.
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
 # A [Promise](/supersonic/guides/technical-concepts/promises/) that resolves once all the model instances in the collection have been perisisted to the cloud backend.
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
 # @name model-instance
 # @instance
 # @description
 # A Supersonic Data Model instance. Represents a single resource fetched from the cloud backend.
 # @type
 # Collection: {
 #   save: () => Promise
 #   delete: () => Promise
 # }
 # @methods save delete
 # @define {Function} save Persist the data in this model instance to the cloud backend.
 # @define {Function} delete Remove this model instance from the cloud backend.
###
###
 # @namespace supersonic.data
 # @name model.save
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
###
###
 # @namespace supersonic.data
 # @name model.delete
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
###
