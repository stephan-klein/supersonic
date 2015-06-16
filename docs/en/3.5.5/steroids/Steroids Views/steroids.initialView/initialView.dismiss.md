steroids.initialView.dismiss
============================

> Dismisses the currently open Initial View

    steroids.initialView.dismiss()

Description
-----------

When called from inside the Initial View, loads the rest of the app and then dismisses the Initial View with an animation. While the rest of the app is loading, a native loading spinner overlay is shown in the center of the screen.

Full Example
------------

    var dismissAnimation = new steroids.Animation({
      transition: "flipHorizontalFromLeft",
    });

    steroids.initialView.dismiss({
      animation: dismissAnimation
    }, {
      onSuccess: function() {
        steroids.logger.log("Initial View dismissed!");
      },
      onFailure: function() {
        steroids.logger.log("Could not dismiss Initial View.");
      }
    });

Parameters
----------

- __animation__: A steroids.Animation object; defines the animation used to dismiss the Initial View and reveal the app underneath.

Callbacks
---------

- __onSuccess__: Called once the Initial View starts dismissing.
- __onFailure__: Called if the Initial View could not be dismissed (e.g. the API call was made from outside the Initial View).
