Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.layer"

  ###*
   * @ngdoc overview
   * @name layer
   * @module ui
   * @description
   * Provides methods to work with layers
  ###

  ###*
   * @ngdoc method
   * @name push
   * @module layer
   * @description
   * Navigates to a given view
   * @param {View} A view object
   * @returns
   * @usage
   * ```coffeescript
   * v = supersonic.ui.view("http://www.google.com")
   * supersonic.ui.layer.push(v)
   * ```
  ###
  push: (view)->
    new Promise (resolve, reject)->
      steroids.layers.push {
          view: view.getWebView()
      }, {
        onSuccess: ()->
          supersonic.logger.info "New layer is shown"
          resolve()
        onFailure: (error)->
          supersonic.logger.info "New layer was not shown due to an error #{error.errorDescription}"
          reject()
      }

  ###*
   * @ngdoc method
   * @name pop
   * @module layer
   * @description
   * Removes the topmost view from the navigation stack
   * @returns
   * @usage
   * ```coffeescript
   * supersonic.ui.layer.pop()
   * ```
  ###
  pop: ()->
    new Promise (resolve, reject)->
      steroids.layers.pop {}, {
        onSuccess: ()->
          supersonic.logger.info "The layer was poppped"
          resolve()
        onFailure: (error)->
          supersonic.logger.info "Popping the layer failes with this error: #{error.errorDescription}"
          reject()
      }

  ###*
   * @ngdoc method
   * @name popAll
   * @module layer
   * @description
   * Pops all views except for the root view from the layer stack
   * @returns
   * @usage
   * ```coffeescript
   * supersonic.ui.layer.popAll()
   * ```
  ###
  popAll: ()->
    new Promise (resolve, reject)->
      steroids.layers.popAll {}, {
        onSuccess: ()->
          supersonic.logger.info "The layer was poppped"
          resolve()
        onFailure: (error)->
          supersonic.logger.info "Popping the layer failes with this error: #{error.errorDescription}"
          reject()
      }

  ###*
   * @ngdoc method
   * @name showInitial
   * @module layer
   * @description
   * Shows initial view
   * @param {Object} Parameters of animation
   * @returns {Promise}
   * @usage
   * ```coffeescript
   * supersonic.ui.layer.showInitial()
   * ```
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
          supersonic.logger.info "Showing of an initial view was failed"
          reject()
        })

  ###*
   * @ngdoc method
   * @name hideInitial
   * @module layer
   * @description
   * Hides initial view
   * @param {Object} Parameters of animation
   * @returns {Promise}
   * @usage
   * ```coffeescript
   * supersonic.ui.layer.hideInitial()
   * ```
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
          supersonic.logger.info "Hiding of an initial view was failed"
          reject()

        })
