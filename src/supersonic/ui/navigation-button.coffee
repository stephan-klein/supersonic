Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.navigationButton"

  ###*
   * @category core
   * @module ui
   * @name navigationButton
   * @overview
   * @description
   * Creates new navigation button and sets its params
  ###

  class Button

    ###*
     * @module navigationButton
     * @name view
     * @constructor
     * @description
     * Creates a new navigation button
     * @param {Object} Button parameters
     * @returns {Button} Button object
     * @usage
     * ```coffeescript
     * leftButton = new supersonic.ui.navigationButton({
     *   title: "Left"
     *   onTap: ()->
     *     alert "left"
     * });
     * ```
    ###
    constructor: (params)->
      btn = new steroids.buttons.NavigationBarButton()
      for key of params
        btn[key] = params[key]
      return btn


  return (params)->
    new Button(params)
