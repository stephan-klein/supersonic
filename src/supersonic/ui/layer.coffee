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
    # TODO: Promisify
    steroids.layers.push {
        view: view.getWebView()
    }, {
      onSuccess: ()->
        supersonic.logger.info "New layer is shown"
      onFailure: (error)->
        supersonic.logger.info "New layer was not shown due to an error #{error.errorDescription}"
    }

  showInitial: (params)->
    new Promise (resolve, reject)->
      steroids.initialView.show({},{
        onSuccess: ()->
          supersonic.logger.info "Initial view was shown"
          resolve()
        onFailure: ()->
          supersonic.logger.info "Showing of an initial view was failed"
          reject()
        })

  hideInitial: (params)->
    new Promise (resolve, reject)->
      steroids.initialView.dismiss({}, {
        onSuccess: ()->
          supersonic.logger.info "Initial view was hidden"
          resolve()
        onFailure: ()->
          supersonic.logger.info "Hiding of an initial view was failed"
          reject()

        })
