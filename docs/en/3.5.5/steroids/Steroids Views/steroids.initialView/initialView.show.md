steroids.initialView.show
=========================

> Shows the Initial View and discards the current app's WebViews from memory.

    steroids.initialView.show()

Description
-----------

When called, shows the Initial View with an animation, after which all the other WebViews in the app are discarded from memory. To reload the app, simply call steroids.initialView.dismiss() again.

Implementation note
-------------------

Calling `steroids.initialView.show` will hide the navigation bar, which must be manually reshown with steroids.view.navigationBar.show` after the initialView is in view.

Full Example
------------

The Initial View needs to also be defined in `config/application.coffee` – read more in the [Initial View guide](http://academy.appgyver.com/guides/107).

    var showAnimation = new steroids.Animation({
      transition: "flipHorizontalFromRight",
    });

    steroids.initialView.show({
      animation: showAnimation
    }, {
      onSuccess: function() {
        steroids.logger.log("Initial View showing!");
      },
      onFailure: function() {
        steroids.logger.log("Could not show Initial View.");
      }
    });

Parameters
----------

- __animation__: A steroids.Animation object; defines the animation used to show the Initial View.

Callbacks
---------

- __onSuccess__: Called once the Initial View begins to display.
- __onFailure__: Called if the Initial View could not be shown (e.g. if the Initial View is not defined or the API call was made from inside the Initial View).
