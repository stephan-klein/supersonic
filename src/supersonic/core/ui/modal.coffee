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
   # @usageCoffeeScript
   # supersonic.ui.modal.show view, options
   # @usageJavaScript
   # supersonic.ui.modal.show(view, options);
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
   # A promise that is resolved when the modal starts to show. If there modal cannot be shown (e.g. the view is invalid), the promise is rejected.
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
      .then (view)->
        options.view = view._webView
        steroids.modal.show options,
          onSuccess: resolve
          onFailure: (error)->
            reject(error)

  ###
   # @namespace supersonic.ui.modal
   # @name hide
   # @function
   # @description
   # Hides the (topmost) modal on screen.
   # @usageCoffeeScript
   # supersonic.ui.modal.hide options
   # @usageJavaScript
   # supersonic.ui.modal.hide(options);
   # @type
   # supersonic.ui.modal.hide: (
   #   options?:
   #     animate?: Boolean
   # ) => Promise
   # @define {Object} options The options object for defining how the modal will be hidden.
   # @define {Boolean} options.animate=true If set to `false`, the modal will be hidden immediately, without the default "slide-from-top" animation.
   # @returnsDescription
   # A promise that is resolved when the modal starts to hide. If there is no modal on screen, the promise is rejected.
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
   # @usageCoffeeScript
   # supersonic.ui.modal.hideAll options
   # @usageJavaScript
   # supersonic.ui.modal.hideAll(options);
   # @type
   # supersonic.ui.modal.hideAll: (
   #   options?:
   #     animate?: Boolean
   # ) => Promise
   # @define {Object} options The options object for defining how the modals will be hidden.
   # @define {Boolean} options.animate=true If set to `false`, the modals will be hidden immediately, without the default "slide-from-top" animation.
   # @returnsDescription
   # A promise that is resolved when the modals start to hide. If there are no modals on screen, the promise is rejected.
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
    new Promise (resolve, reject)->
      steroids.modal.hideAll options, {
        onSuccess: resolve
        onFailure: (error)->
          reject(error)
    }
