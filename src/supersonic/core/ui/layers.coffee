Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.layers', log

  ###
   # @namespace supersonic.ui
   # @name layers
   # @overview
   # @description
   # Provides methods to work with native navigation stack, i.e. "layers".
  ###

  ###
   # @namespace supersonic.ui.layers
   # @name push
   # @function
   # @description
   # Pushes a View on top of the navigation stack.
   # @usageJavaScript
   # var view = supersonic.ui.view("bananas#show");
   # supersonic.ui.layers.push(view);
   # @type
   # supersonic.ui.layers.push: (
   #   view: View|String
   # ) => Promise
   # @define {View|String} view A View or View identifier to be pushed on top of the navigation stack.
   # @returnsDescription
   # A promise that gets resolved with the provided View instance once the push has started. If the view cannot be pushed, the promise is rejected.
   # @exampleJavaScript
   # var view = supersonic.ui.view("common#settings");
   # supersonic.ui.layers.push(view)
   #
   # supersonic.ui.views.find("settingsView").then( function() {
   #   supersonic.ui.layers.push(startedView)
   # });
  ###
  push: s.promiseF "push", (viewOrId) ->
    new Promise (resolve, reject) ->
      supersonic.ui.views.get(viewOrId)
      .then (view)->
        steroids.layers.push
          view: view._webView
        ,
          onSuccess: ->
            resolve(view)
          onFailure: reject

  ###
   # @namespace supersonic.ui.layers
   # @name pop
   # @function
   # @description
   # Pops the topmost view from the navigation stack. Doesn't have to be called from the topmost view.
   # @usageJavaScript
   # supersonic.ui.layers.pop();
   # @type
   # supersonic.ui.layers.pop: () => Promise
   # @returnsDescription
   # A promise that gets resolved once the view starts to pop. If the view cannot be popped (i.e. there is only the root view in the navigation stack), the promise is rejected. Note that a popped view only lives on for a very short time before it is purged from the app's memory, so be careful to not do too complex things with the promise. It is different if you are popping a StartedView, since it will remain running outside the navigation stack.
  ###
  pop: s.promiseF "pop", ()->
    new Promise (resolve, reject)->
      steroids.layers.pop {}, {
        onSuccess: ()->
          resolve()
        onFailure: (error)->
          reject(error)
      }

  ###
   # @namespace supersonic.ui.layers
   # @name popAll
   # @function
   # @description
   # Pops all views except for the root view from the navigation stack. Doesn't have to be called from the topmost view.
   # @usageJavaScript
   # supersonic.ui.layers.popAll()
   # @type
   # supersonic.ui.layers.popAll: () => Promise
   # @returnsDescription
   # A promise that gets resolved once the views start to pop. If there are no views to pop (i.e. there is only the root view in the navigation stack), the promise is rejected. Note that popped views only live on for a very short time before they are purged from the app's memory, so be careful to not do too complex things with the promise. It is different if you are popping StartedViews, since they will remain running outside the navigation stack.
  ###
  popAll: s.promiseF "popAll", ()->
    new Promise (resolve, reject) ->
      steroids.layers.popAll {}, {
        onSuccess: ()->
          resolve()
        onFailure: (error)->
          reject(error)
      }
