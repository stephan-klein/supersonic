Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.modal', log

  ###
   # @namespace supersonic.ui
   # @name modal
   # @overview
   # @description
   # Provides methods to show and hide modals. A modal appears on top of your entire app and contains its own navigation stack.
  ###

  ###
   # @namespace supersonic.ui.modal
   # @name show
   # @function
   # @description
   # Shows the given View or started View as a modal.
   # @type
   # supersonic.ui.modal.show: (
   #   view: View
   #   options?:
   #     animate?: Boolean
   # ) => Promise
   # @define {View} view The View or started View to be shown as a modal.
   # @define {Object} options The options object for defining how the modal will be shown.
   # @define {Boolean} options.animate=true If set to `false`, the modal will be shown immediately, without the default "slide-from-bottom" animation.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that is resolved when the modal starts to show. If there modal cannot be shown (e.g. the view is invalid), the promise is rejected.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # modalView = new supersonic.ui.View "common#modal"
   # options =
   #   animate: true
   #
   # supersonic.ui.modal.show modalView, options
   # @exampleJavaScript
   # var modalView = new supersonic.ui.View("common#modal");
   # var options = {
   #   animate: true
   # }
   #
   # supersonic.ui.modal.show(modalView, options);
  ###
  show: s.promiseF "show", (viewOrId, options = {})->
    new Promise (resolve, reject)->
      supersonic.ui.views.find(viewOrId)
      .tap (view)->
        view.isStarted().then (started)->
          return unless options.params?

          if started
            supersonic.logger.log "Sending parameters (#{options.params}) to view (id: #{view.id})"
            supersonic.data.channel("view-params-#{view.id}").publish(options.params)
          else
            view._webView.setParams options.params

      .then (view)->
        options.view = view._webView
        options.disableAnimation = if options?.animate?
          switch options.animate
            when true then false
            when false then true
        else
          false

        steroids.modal.show options,
          onSuccess: ->
            resolve view
          onFailure: (error)->
            reject new Error error.errorDescription

  ###
   # @namespace supersonic.ui.modal
   # @name hide
   # @function
   # @description
   # Hides the (topmost) modal on screen.
   # @type
   # supersonic.ui.modal.hide: (
   #   options?:
   #     animate?: Boolean
   # ) => Promise
   # @define {Object} options The options object for defining how the modal will be hidden.
   # @define {Boolean} options.animate=true If set to `false`, the modal will be hidden immediately, without the default "slide-from-top" animation.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that is resolved when the modal starts to hide. If there is no modal on screen, the promise is rejected.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # options =
   #   animate: false
   #
   # supersonic.ui.modal.hide options
   # @exampleJavaScript
   # var options = {
   #   animate: false
   # }
   #
   # supersonic.ui.modal.hide(options);
  ###
  hide: s.promiseF "hide", (options = {})->
    options.disableAnimation = if options?.animate?
      switch options.animate
        when true then false
        when false then true
    else
      false
    new Promise (resolve, reject)->
      steroids.modal.hide options, {
        onSuccess: resolve
        onFailure: (error)->
          reject(error)
    }

  ###
   # @namespace supersonic.ui.modal
   # @name hideAll
   # @function
   # @description
   # Hides all modals on screen.
   # @type
   # supersonic.ui.modal.hideAll: (
   #   options?:
   #     animate?: Boolean
   # ) => Promise
   # @define {Object} options The options object for defining how the modals will be hidden.
   # @define {Boolean} options.animate=true If set to `false`, the modals will be hidden immediately, without the default "slide-from-top" animation.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that is resolved when the modals start to hide. If there are no modals on screen, the promise is rejected.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # options =
   #   animate: false
   #
   # supersonic.ui.modal.hideAll options
   # @exampleJavaScript
   # var options = {
   #   animate: false
   # }
   #
   # supersonic.ui.modal.hideAll(options);
  ###

  hideAll: s.promiseF "hideAll", (options = {})->
    options.disableAnimation = if options?.animate?
      switch options.animate
        when true then false
        when false then true
    else
      false
    new Promise (resolve, reject)->
      steroids.modal.hideAll options, {
        onSuccess: resolve
        onFailure: (error)->
          reject(error)
    }
