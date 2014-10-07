Promise = require 'bluebird'


module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.ui.navigationBar"

  ###
   # @category core
   # @module ui
   # @name navigationBar
   # @overview
   # @description
   # Provides methods to work with the native navigation bar.
  ###

  ###
   # @module ui.navigationBar
   # @name show
   # @description
   # Shows the native navigation bar for the current view.
   # @apiCall supersonic.ui.navigationBar.show
   # @function
   # @type
   # show: (
   #   options?: {
   #     animated?: true
   #   }
   # ) => Promise
   # @define options={} An object of optional parameters which define how the navigation bar will be shown.
   # @define options.animated=true Determines if the navigation bar will be shown with an animation.
   # @returns {Promise} A promise that will be resolved after the navigation bar is shown.
   # @usageCoffeeScript
   # supersonic.ui.navigationBar.show({ animated: false }).then ()->
   #   supersonic.logger.log "Navigation bar shown without animation.
   # @usageJavaScript
   # supersonic.ui.navigationBar.show({ animated: false }).then(function() {
   #   supersonic.logger.log("Navigation bar shown without animation.");
   # });
   #
  ###
  show: (params = {})->
    filteredParams =
      animated: params.animated

    new Promise (resolve, reject)->
      steroids.view.navigationBar.show filteredParams, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar was shown"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Could not show the navigation bar: #{error.errorDescription}"
          reject()
      }

  ###
   # @module navigationBar
   # @name hide
   # @function
   # @description
   # Hides the native navigation bar for the current view.
   # @signature
   # hide: (
   #   options?:
   #     animated?: Boolean
   # ) => Promise
   # @define {options} An object of optional parameters which define how the navigation bar will be hidden.
   # @define {animated=true} Determines if the navigation bar will be hidden with an animation.
   # @returns {Promise} A promise that will be resolved after the navigation bar is hidden.
   # @usageCoffeeScript
   # supersonic.ui.navigationBar.hide({ animated: true }).then ()->
   #   supersonic.logger.log "promise works"
  ###
  hide: (params = {})->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.hide params, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar was hidden"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Hiding the navigation bar crashed due to the error: #{error.errorDescription}"
          reject()
      }

  ###
   # @module navigationBar
   # @name update
   # @function
   # @description
   # Updates the navigation bar
   # @define {options} An object of optional parameters which define how the navigation bar will be shown.
   # @define {animated=true} Determines if the navigation bar will be shown with an animation.
   # @returns {Promise} A promise that will be resolved after the navigation bar is shown.
   # @returns {Promise}
   # @usageCoffeeScript
   # leftButton = new supersonic.ui.navigationButton({
   #   title: "Left"
   #   onTap: ()->
   #     supersonic.notification.alert "Left button tapped"
   # supersonic.ui.navigationBar.update({
   #   overrideBackButton: true,
   #   buttons: {
   #     left: [leftButton]
   #   }
   # }).then ()->
   #   supersonic.logger.log "promise works"
   # ```
  ###
  update: (params)->
    new Promise (resolve, reject)->
      # debugger
      steroids.view.navigationBar.update params, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar was updated"
          resolve()
        onFailure: ()->
          supersonic.logger.error "Updating the navigation bar chashed"
          reject()
      }
