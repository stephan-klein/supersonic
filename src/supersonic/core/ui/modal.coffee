Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.modal"

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
   # Shows the given View or StartedView as a modal.
   # @usageJavaScript
   # supersonic.ui.modal.show(view, options);
   # @type
   # supersonic.ui.modal.show: (
   #   view: View|StartedView
   #   options?:
   #     animate?: Boolean
   # ) => Promise
   # @define {View|StartedView} view The View or StartedView to be shown as a modal.
   # @define {Object} options The options object for defining how the modal will be shown.
   # @define {Boolean} options.animate=true If set to `false`, the modal will be shown immediately, without the default "slide-from-bottom" animation.
   # @returnsDescription
   # A promise that is resolved when the modal starts to show. If there modal cannot be shown (e.g. the view is invalid), the promise is rejected.
   # @exampleJavaScript
   # var modalView = supersonic.ui.view("common#modal");
   # var options = {
   #   animate: true
   # }
   #
   # supersonic.ui.modal.show(modalView, options);
  ###
  show: (view, params = {})->
    new Promise (resolve, reject)->
      params.view = view._getWebView()
      steroids.modal.show params, {
        onSuccess: ()->
          supersonic.logger.info "Modal view was shown"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Showing a modal view has crashed with the error: #{error.errorDescription}"
          reject()
    }

  ###
   # @namespace supersonic.ui.modal
   # @name hide
   # @function
   # @description
   # Hides the (topmost) modal on screen.
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
   # @exampleJavaScript
   # var options = {
   #   animate: false
   # }
   #
   # supersonic.ui.modal.hide(options);
  ###
  hide: (params = {})->
    new Promise (resolve, reject)->
      # debugger
      steroids.modal.hide params, {
        onSuccess: ()->
          supersonic.logger.info "Modal view was hidden"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Hiding a modal view has crashed with the error: #{error.errorDescription}"
          reject()
    }

  ###
   # @namespace supersonic.ui.modal
   # @name hideAll
   # @function
   # @description
   # Hides all modals on screen.
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
   # @exampleJavaScript
   # var options = {
   #   animate: false
   # }
   #
   # supersonic.ui.modal.hideAll(options);
  ###

  hideAll: (params = {})->
    new Promise (resolve, reject)->
      steroids.modal.hideAll params, {
        onSuccess: ()->
          supersonic.logger.info "All the modals were hidden"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Hiding all the modals has crashed with the error: #{error.errorDescription}"
          reject()
    }
