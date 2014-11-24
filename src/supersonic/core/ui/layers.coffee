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
   # @type
   # supersonic.ui.layers.push: (
   #   view: View|String
   #   options?:
   #     params?: Object|String
   # ) => Promise
   # @define {View|String} view A View or View identifier to be pushed on top of the navigation stack.
   # @define {String|Object} params On object or JSON string of optional parameters to be passed to the target View, accessible via `supersonic.ui.views.params.current`.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that gets resolved with the provided View instance once the push has started. If the view cannot be pushed, the promise is rejected.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # view = new supersonic.ui.View "common#settings"
   # supersonic.ui.layers.push view
   #
   # supersonic.ui.views.find("settingsView").then (startedView) ->
   #   supersonic.ui.layers.push startedView
   #
   # @exampleJavaScript
   # var view = new supersonic.ui.View("common#settings");
   # supersonic.ui.layers.push(view)
   #
   # supersonic.ui.views.find("settingsView").then( function(startedView) {
   #   supersonic.ui.layers.push(startedView)
   # });
  ###
  push: s.promiseF "push", (viewOrId, options={}) ->
    new Promise (resolve, reject) ->
      supersonic.ui.views.find(viewOrId)
      .tap (view)->
        view.isStarted().then (started)->
          return unless options.params?

          if started
            supersonic.logger.debug "Sending parameters (#{options.params}) to view (id: #{view.id})"
            supersonic.data.channel("view-params-#{view.id}").publish(options.params)
          else
            view._webView.setParams options.params

      .then (view)->
        steroids.layers.push
          view: view._webView
        ,
          onSuccess: ->
            resolve view
          onFailure: (error)->
            reject new Error error.errorDescription

  ###
   # @namespace supersonic.ui.layers
   # @name pop
   # @function
   # @description
   # Pops the topmost view from the navigation stack. Doesn't have to be called from the topmost view.
   # @type
   # supersonic.ui.layers.pop: () => Promise
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that gets resolved once the view starts to pop. If the view cannot be popped (i.e. there is only the root view in the navigation stack), the promise is rejected. Note that a popped view only lives on for a very short time before it is purged from the app's memory, so be careful to not do too complex things with the promise. It is different if you are popping a started View, since it will remain running outside the navigation stack.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.layers.pop()
   # @exampleJavaScript
   # supersonic.ui.layers.pop();
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
   # @type
   # supersonic.ui.layers.popAll: () => Promise
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that gets resolved once the views start to pop. If there are no views to pop (i.e. there is only the root view in the navigation stack), the promise is rejected. Note that popped views only live on for a very short time before they are purged from the app's memory, so be careful to not do too complex things with the promise. It is different if you are popping started Views, since they will remain running outside the navigation stack.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.layers.popAll()
   # @exampleJavaScript
   # supersonic.ui.layers.popAll();
  ###
  popAll: s.promiseF "popAll", ()->
    new Promise (resolve, reject) ->
      steroids.layers.popAll {}, {
        onSuccess: ()->
          resolve()
        onFailure: (error)->
          reject(error)
      }
