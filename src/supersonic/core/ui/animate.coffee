Promise = require 'bluebird'


module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.ui.animate"
  ###
   # @namespace supersonic.ui
   # @name animate
   # @function
   # @description
   # Performs an in-place animation on the current view.
   # @type
   # animate: (
   #   animationType: String
   #   options?:
   #     duration?: Number
   #     curve?: String
   # ) => Animation
   # @define {String} animationType The animation type. Valid values are:
   # <ul>
   #   <li>`fade`: Dissolves the view into the next one.
   #   <li>`flipVerticalFromBottom`: Flips the view around its horizontal axis from bottom to top.
   #   <li>`flipVerticalFromTop`: Flips the view around its horizontal axis from top to bottom.
   #   <li>`flipHorizontalFromLeft`: Flips the view around its vertical axis from left to right.
   #   <li>`flipHorizontalFromRight`: Flips the view around its vertical axis from right to left.
   #   <li>`slideFromLeft`: Slides the view from left to right.
   #   <li>`slideFromRight`: Slides the view from right to left.
   #   <li>`slideFromTop`: Slides the view down from top.
   #   <li>`slideFromBottom`: Slides the view up from bottom.
   # </ul>
   # @define {Object} options= An object of additional options for the animation.
   # @define {String} options.duration=0.8 The duration, in seconds, of the animation.
   # @define {String} options.curve=easeInOut The velocity curve of the animation. Valid values are:
   # <ul>
   #   <li>`easeInOut`: An ease-in ease-out curve causes the animation to begin slowly, accelerate through the middle of its duration, and then slow down again before completing.
   #   <li>`easeIn`: An ease-in curve causes the animation to begin slowly, and then speed up as it progresses.
   #   <li>`easeOut`: An ease-out curve causes the animation to begin quickly, and then slow down as it completes.
   #   <li>`linear`: A linear animation curve causes the animation to occur evenly over its duration.
   # </ul>
   # @returnsDescription
   # A `supersonic.ui.Animation` object.
   # @define {=>Object} animation A `supersonic.ui.Animation` object.
   # @define {=>function} animation.perform  A function returning a [`Promise`](/supersonic/guides/technical-concepts/promises/) that resolves when the animation is about to start.
   # @exampleCoffeeScript
   # supersonic.ui.animate("curlDown").perform()
   #
   # # With options
   # options =
   #    duration: 1.2
   #    curve: "linear"
   # supersonic.ui.animate("curlDown", options).perform().then ->
   #    supersonic.logger.log "About to start an animation"
   # @exampleJavaScript
   # supersonic.ui.animate("curlDown").perform();
   #
   # // With options
   # var options = {
   #    duration: 1.2,
   #    curve: "linear"
   # }
   # supersonic.ui.animate("curlDown", options).perform().then( funtion() {
   #    supersonic.logger.log("About to start an animation");
   # });
  ###
  SUPPORTED_CURVES = [
    "easeInOut"
    "easeIn"
    "easeOut"
    "linear"
  ]

  SUPPORTED_ANIMATION_TYPES = [
    "curlDown"
    "curlUp"
    "fade"
    "flipHorizontalFromRight"
    "flipHorizontalFromLeft"
    "flipVerticalFromTop"
    "flipVerticalFromBottom"
    "slideFromTop"
    "slideFromRight"
    "slideFromLeft"
    "slideFromBottom"
  ]

  _getReversedCurve = (curve)->
    switch curve
      when "easeIn" then "easeOut"
      when "easeOut" then "easeIn"
      else curve

  (animationType, options={})->
    config = {}

    # TODO: check if android and remove curl animations

    # ensure we use supported animation type
    unless animationType in SUPPORTED_ANIMATION_TYPES
      throw new Error "AnimationType '#{animationType}' is not supported'. Available types: #{JSON.stringify(SUPPORTED_ANIMATION_TYPES)}"

    config.transition = animationType

    # steroids.Animation takes care of creating reverse here if needed
    if options.reversedAnimationType?
      config.reversedTransition = options.reversedAnimationType

    # Handle curve for animation
    if options.curve?
      unless options.curve in SUPPORTED_CURVES
        throw new Error "Animation curve '#{options.curve}' is not supported. Available curves: #{JSON.stringify(SUPPORTED_CURVES)}"

      config.curve = options.curve

    # Handle reversed curve because Steroids.Animation does not handle it properly :(
    if options.reversedCurve?
      config.reversedCurve = options.reversedCurve
    else if config.curve?
      config.reversedCurve = _getReversedCurve config.curve

    # set duration and reversed duration if not given
    if options.duration?
      config.duration = options.duration

      unless options.reversedDuration?
        config.reversedDuration = options.duration

    animation = new steroids.Animation config

    # overwrite steroids perform with bettered version
    _perform = animation.perform

    animation.perform = ->
      onAnimationStartedDeferred = Promise.pending()
      onAnimationEndedDeferred = Promise.pending()
      # KNOWN ISSUES: until the animation is completed..
      # iOS: animation started & ended will not be able to run js/manipulate dom
      # Android: animation started can manipulate dom but not run js
      status =
        started: onAnimationStartedDeferred.promise
        ended: onAnimationEndedDeferred.promise

      promise = new Promise (resolve, reject)->
        _perform {},
          onSuccess: ->
            resolve status
          onFailure: (err)->
            reject(err)
          onAnimationStarted: ->
            onAnimationStartedDeferred.resolve status.ended
          onAnimationEnded: ->
            onAnimationEndedDeferred.resolve()

      promise.catch (err)->
        onAnimationStartedDeferred.reject(err)
        onAnimationEndedDeferred.reject(err)

    return animation
