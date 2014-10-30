Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.layer"

  ###
   # @namespace core.ui
   # @name layer
   # @overview
   # @description
   # Provides methods to work with layers
  ###

  ###
   # @namespace core.ui.layer
   # @name push
   # @function
   # @description
   # Navigates to a given view
   # @param {View} A view object
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # v = supersonic.ui.view("http://www.google.com")
   # supersonic.ui.layers.push(v)
   # ```
  ###
  push: (view) ->
    new Promise (resolve, reject) ->
      steroids.layers.push {
        view: view._getWebView()
      }, {
        onSuccess: ->
          resolve()
        onFailure: (error) ->
          reject()
      }

  ###
   # @namespace core.ui.layer
   # @name pop
   # @function
   # @description
   # Removes the topmost view from the navigation stack
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # supersonic.ui.layers.pop()
   # ```
  ###
  pop: ()->
    new Promise (resolve, reject)->
      steroids.layers.pop {}, {
        onSuccess: ()->
          resolve()
        onFailure: (error)->
          reject(error)
      }

  ###
   # @namespace core.ui.layer
   # @name popAll
   # @function
   # @description
   # Pops all views except for the root view from the layer stack
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # supersonic.ui.layers.popAll()
   # ```
  ###
  popAll: ()->
    new Promise (resolve, reject) ->
      steroids.layers.popAll {}, {
        onSuccess: ()->
          resolve()
        onFailure: (error)->
          reject()
      }

  ###
   # @namespace core.ui.layer
   # @name showInitial
   # @function
   # @description
   # Shows initial view
   # @param {Object} Parameters of animation
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # supersonic.ui.layers.showInitial()
   # ```
  ###
  showInitial: (params)->
    if !params
      params = {}
    new Promise (resolve, reject)->
      steroids.initialView.show(params,{
        onSuccess: ()->
          supersonic.logger.info "Initial view was shown"
          resolve()
        onFailure: ()->
          supersonic.logger.error "Showing of an initial view was failed"
          reject()
        })

  ###
   # @module layer
   # @name hideInitial
   # @function
   # @description
   # Hides initial view
   # @param {Object} Parameters of animation
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # supersonic.ui.layers.hideInitial()
   # ```
  ###
  hideInitial: (params)->
    if !params
      params = {}
    new Promise (resolve, reject)->
      steroids.initialView.dismiss(params, {
        onSuccess: ()->
          supersonic.logger.info "Initial view was hidden"
          resolve()
        onFailure: ()->
          supersonic.logger.error "Hiding of an initial view was failed"
          reject()

        })
