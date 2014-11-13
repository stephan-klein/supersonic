module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.buttons.back"

  ###
  # @namespace supersonic.device.buttons.back
  # @name whenPressed
  # @function
  # @apiCall supersonic.device.buttons.back.whenPressed
  # @description
  # Override device back button (Android only).
  # @type
  # supersonic.device.buttons.back.whenPressed: () => unsubscribe: Function
  # @define {Function} unsubscribe Stop listening
  # @usageCoffeeScript
  # supersonic.device.buttons.back.whenPressed()
  # @usageJavaScript
  # supersonic.device.buttons.back.whenPressed();
  # @exampleCoffeeScript
  # supersonic.device.buttons.back.whenPressed().then ->
  #   steroids.logger.log("Device back button was pressed.")
  # @exampleJavaScript
  # supersonic.device.buttons.back.whenPressed().then( function() {
  #   steroids.logger.log("Device back button was pressed.");
  # });
  ###
  override = false
  callbacks = []
  _handler = ->
    cb.fn() for cb in callbacks

  _addCallback = (f)->
    callbacks.push {id: (new Date()).getTime(), fn: f}

  _removeCallback = (id)->
    if callbacks.length is 0
      document.removeEventListener "backbutton", _handler, false
      override = false
    callbacks = (cb for cb in callbacks when cb.id is id)

  whenPressed = (f)->

    id = _addCallback(f).id
    unless override
      document.addEventListener "backbutton", _handler, false
      override = true
      
    return ->
      _removeCallback(id)

  return {whenPressed}
