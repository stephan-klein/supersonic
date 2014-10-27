resource = require 'steroids-data/lib/steroids/data/resource'
###
 # @category core
 # @module data
 # @class
 # @description
 # A Supersonic Data Model class. Provides access to a specific cloud resource through a fluent interface.
 # @type
 # Model: {
 #   @findAll: () => Promise [Model]
 #   @find: (id) => Promise Model
 #   save: => Promise
 #   delete: => Promise
 # }
 # @define {Function} findAll returns a collection of model instances
 # @define {Function} find returns a model instance by a specific id
###
model = {}

module.exports = {
  ###
   # @category core
   # @module data
   # @name resource
   # @function
   # @description
   # Allows access to cloud resources you have configured for your app through Steroids Connect.
   # @param {string} resourceName
   # @returns {Resource}
   # @usage
   # ```coffeescript
   # supersonic.data.resource("task").findAll().then (tasks) ->
   #   console.log "Got tasks!"
   # ```
  ###
  resource

  ###
   # @category core
   # @module data
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
  model
}
