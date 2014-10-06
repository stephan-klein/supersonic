Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.navigationBar"

  ###
   # @category core
   # @module ui
   # @name navigationBar
   # @overview
   # @description
   # Provides methods to work with navigation bar
  ###

  ###
   # @module navigationBar
   # @name show
   # @function
   # @description
   # Shows a navigation bar
   # @param {Object} [parameters] Parameters of hiding
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # supersonic.ui.navigationBar.show({ animated: true, title: "New Title" }).then ()->
   #   supersonic.logger.log "promise works"
   # ```
  ###
  show: (params = {})->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.show params, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar was shown"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Showing the navigation bar crashed due to the error: #{error.errorDescription}"
          reject()
      }

  ###
   # @module navigationBar
   # @name hide
   # @function
   # @description
   # Hides a navigation bar
   # @param {Object} [parameters] Parameters of hiding
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # supersonic.ui.navigationBar.hide({ animated: true }).then ()->
   #   supersonic.logger.log "promise works"
   # ```
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
   # @param {Object} [parameters] Parameters of hiding
   # @returns {Promise}
   # @usage
   # ```coffeescript
   # leftButton = new supersonic.ui.navigationButton({
   #   title: "Left"
   #   onTap: ()->
   #     alert "left"
   # });
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
