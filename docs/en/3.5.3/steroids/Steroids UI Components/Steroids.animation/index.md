steroids.Animation
==========

Native animations are great for smoothening the application's look and feel.
The same native animations are available as transition effects when opening or closing layers.
Consider using multiple `steroids.views` instead when possible.

If opening a new view layer is not possible or not desired (a new layer is always added to the navigation stack), then using the animation API is a viable option.

__NOTE:__ `slideFrom*` animations currently do not work when a device is in landscape mode.  This will be fixed in a future release.

<iframe src="http://player.vimeo.com/video/58669546?autoplay=1&loop=1" width="320" height="480" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>


Constructor
-----------

    var fade = new steroids.Animation("fade");

Constructor parameters
----------------------
- __transition__: Type of the animation to perform. __Required__. Valid values are:
  - __fade__: Dissolves the layer for the duration.
  - __curlUp__: Curls the layer up from the bottom.
  - __curlDown__: Curls the layer down from the top.
  - __flipVerticalFromBottom__: Flips the layer around its horizontal axis from bottom to top.
  - __flipVerticalFromTop__: Flips the layer around its horizontal axis from top to bottom.
  - __flipHorizontalFromLeft__: Flips the layer around its vertical axis from left to right.
  - __flipHorizontalFromRight__: Flips the layer around its vertical axis from right to left.
  - __slideFromLeft__: Slides the layer from left to right.
  - __slideFromRight__: Slides the layer from right to left.
  - __slideFromTop__: Slides the layer down from top.
  - __slideFromBottom__: Slides the layer up from bottom.
- __duration__: The duration for the animation in seconds as an integer or a decimal number. Default: 0.7. Optional.
- __reversedDuration__: The duration for the animation when used with `steroids.layers.pop`.
- __curve__: The velocity distribution of the animation. Optional.  Valid values are:
  - __easeInOut__: An ease-in ease-out curve causes the animation to begin slowly, accelerate through the middle of its duration, and then slow again before completing (default).
  - __easeIn__: An ease-in curve causes the animation to begin slowly, and then speed up as it progresses.
  - __easeOut__: An ease-out curve causes the animation to begin quickly, and then slow as it completes.
  - __linear__: A linear animation curve causes an animation to occur evenly over its duration.
- __reversedCurve__: The velocity distribution when the animation is used with `steroids.layers.pop`.


Full example
------------

    var slowAndLinearCurlDown = new steroids.Animation({
      transition: "curlDown",
      duration: 1.2,
      curve: "linear"
    });

    slowAndLinearCurlDown.perform()




steroids.Animation.prototype.perform
=======

Performs an animation using the current layer.

    var flip = new steroids.Animation( { transition: "flipHorizontalFromLeft" } );
    flip.perform();

### Optional parameters

- __duration__: The duration for the animation as an integer or a decimal number. Default: 0.7. Optional.
- __curve__: The velocity distribution of the animation. Optional.  Valid values are:
  - __easeInOut__: An ease-in ease-out curve causes the animation to begin slowly, accelerate through the middle of its duration, and then slow again before completing (default).
  - __easeIn__: An ease-in curve causes the animation to begin slowly, and then speed up as it progresses.
  - __easeOut__: An ease-out curve causes the animation to begin quickly, and then slow as it completes.
  - __linear__: A linear animation curve causes an animation to occur evenly over its duration.


Full example
------------
    var flip = new steroids.Animation( { transition: "flipHorizontalFromLeft" } );
    flip.perform({
      duration: 1.2,
      curve: "linear"
    }, {
      onSuccess: function() {
        alert("animation starting");
      },
      onFailure: function() {
        alert("animation failed to start");
      },
      onAnimationStarted: function() {
        alert("animation has started")
      },
      onAnimationEnded: function() {
        alert("animation has ended")
      }
    });


Callbacks
---------

- __onSuccess__: Called once the animation is successfully about to start. To determine when the actual animation has started, the `onAnimationStarted` callback should be used instead.
- __onFailure__: Called if the animation could not be started. There might be another animation playing at the moment, or the animation might not be supported in current device orientation mode.
- __onAnimationStarted__: Called once the animation has started.
- __onAnimationEnded__: Caled once the animation has ended.

Supported Platforms
-------------------

- iOS


