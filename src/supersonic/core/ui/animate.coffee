###
 # @namespace supersonic.ui
 # @name animate
 # @function
 # @description
 # Performs an in-place animation on the current view.
 # @usageJavaScript
 # supersonic.ui.animate(animationType, options)
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
###
