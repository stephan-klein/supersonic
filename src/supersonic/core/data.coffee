data = require 'ag-data'

module.exports = (logger, window) ->
  # Connect ag-data to a resource bundle from window.ag.data such that errors
  # are correctly wrapped and logged. Notably, if window.ag.data exists but
  # does not define a valid bundle, an error will be logged without interaction.
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

  {
    ###
     # @namespace core.data
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
    ###
    model: createModel
  }

###
 # @namespace core.data
 # @name Model
 # @class
 # @description
 # A Supersonic Data Model class. Provides access to a specific cloud resource through a fluent interface.
 # @type
 # Model: {
 #   findAll: () => Promise Collection
 #   find: (id) => Promise Resource
 # }
 # @methods find findAll
 # @define {Function} findAll returns a collection of resources
 # @define {Function} find returns a resource by a specific id
###
###
 # @namespace core.data
 # @name Model.findAll
 # @function
 # @type
 # findAll: () => Promise collection: Collection Resource
 # @description
 # Access a collection of resources
 # @exampleCoffeeScript
 # supersonic.data.model('task').findAll().then (tasks) ->
 #   for task in tasks
 #      console.log task.description
###
###
 # @namespace core.data
 # @name Collection.save
 # @function
 # @type
 # Collection.save: () => Promise
 # @description
 # Persist all resources in this collection
 # @exampleCoffeeScript
 # supersonic.data.model('task').findAll().then (tasks) ->
 #   for task in tasks
 #     task.completed = true
 #   tasks.save()
###
###
 # @namespace core.data
 # @name Model.find
 # @function
 # @type
 # find: (id) => Promise Resource
 # @description
 # Find a resource from the cloud by an id
 # @exampleCoffeeScript
 # supersonic.data.model('task').find(123).then (task) ->
 #   console.log task.description
###
###
 # @namespace core.data
 # @name Resource.save
 # @function
 # @type
 # resource.save: () => Promise
 # @description
 # Persist the data in this resource to the cloud. If the instance is new, create it in the cloud; otherwise update the existing cloud resource.
 # @exampleCoffeeScript
 # supersonic.data.model('task').find(123).then (task) ->
 #   task.done = true
 #   task.save()
###
###
 # @namespace core.data
 # @name Resource.delete
 # @function
 # @type
 # resource.delete: () => Promise
 # @description
 # Remove this resource from the cloud backend.
 # @exampleCoffeeScript
 # supersonic.data.model('task').find(123).then (task) ->
 #   if task.done
 #     task.delete()
###
