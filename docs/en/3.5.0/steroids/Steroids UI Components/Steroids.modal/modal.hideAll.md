steroids.modal.hideAll
======================

Dismisses all open modals.

    steroids.modal.hideAll();

Description
-----------

`steroids.modal.hideAll` dismisses all modals opened with an animation and shows the application.
The memory reserved for the `steroids.views.*` views presented in the modal windows is freed.

__Note:__ on Android calling `steroids.modal.hideAll`, while somewhat comparable to pressing native back button, doesn't close the app. (On Android pressing the native back button goes to the previous layer of the app OR closes the app if no previous layer exists.)

Full Example
------------

    steroids.modal.hideAll({
        disableAnimation: true
      }, {
      onSuccess: function() {
        alert("Modal dismissed");
      },
      onFailure: function(error) {
        alert("Could not dismiss the modal: " + error.errorDescription);
      }
    });


Parameters
----------

- __disableAnimation__: if `true`, the modals will be removed from the screen immediately, without animation.

Callbacks
---------

- __onSuccess__: Called once the modals start to animate away from the screen.
- __onFailure__: Called if the modals could not be dismissed or no modal is open.

Supported Platforms
-------------------

- iOS
- Android
