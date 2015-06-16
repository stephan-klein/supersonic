steroids.modal.hide
===================

Dismisses any modal opened.

    steroids.modal.hide();

Description
-----------

`steroids.modal.hide` dismisses any modal opened with an animation and shows the application.
The memory reserved for the `steroids.views.*` view presented in the modal window is freed.

__Note:__ on Android calling `steroids.modal.hide`, while comparable to pressing native back button, doesn't close the app. (On Android pressing the native back button goes to the previous layer of the app OR closes the app if no previous layer exists.)

Full Example
------------

    steroids.modal.hide({
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

- __disableAnimation__: if `true`, the modal will be removed from the screen immediately, without animation.

Callbacks
---------

- __onSuccess__: Called once the modal starts to animate away from the screen.
- __onFailure__: Called if the modal could not be dismissed or no modal is open.

Supported Platforms
-------------------

- iOS
- Android
