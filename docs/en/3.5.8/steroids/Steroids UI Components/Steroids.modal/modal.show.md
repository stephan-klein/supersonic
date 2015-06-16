steroids.modal.show
===================

Shows a view on top of the whole application.

    var googleView = new steroids.views.WebView("http://www.google.com");

    steroids.modal.show(googleView);

Description
-----------

`steroids.modal.show` shows a modal window on top of the whole application. The modal opens with an animation.

Only one modal can be shown at a time.
You need to manually dismiss any modals that might be open by calling `steroids.modal.hide`.

Full Example
------------

    var googleView = new steroids.views.WebView( { location: "http://www.google.com" } );

    steroids.modal.show( {
      view: googleView,
      keepLoading: true,
      navigationBar: true,
      disableAnimation: true,
      waitTransitionEnd: true,
      allowedRotations: ["portrait", "portraitUpsideDown"]
    }, {
      onSuccess: function() {
        alert("Modal is being presented!");
      },
      onFailure: function(error) {
        alert("Could not present the modal: " + error.errorDescription);
      }

    });

Parameters
----------

As a convenience shortcut, you can simply call `steroids.modal.show` with a single `steroids.views.*` object as the parameter.

Otherwise, you should use the options object, which has the following parameters:

- __view__: A steroids.views.* view to be opened. Required.
- __disableAnimation__: if `true`, the modal will be shown immediately, without animation.
- __keepLoading__: Keeps [loading.html](http://guides.appgyver.com/steroids/guides/ios/loading-html/)/[loading.png](http://guides.appgyver.com/steroids/guides/android/loading-png/) visible in the modal when set to `true`. The target view must remove to loading screen with steroids.view.removeLoading.
- __navigationBar__: If `true`, the modal will open with the navigation bar visible.
- __waitTransitionEnd__: If `true`, modal will be shown after all other transitions are completed.
- __allowedRotations__: Array containing the allowed rotations for the modal. If not set, all rotations are allowed.

Callbacks
---------

- __onSuccess__: Called once the modal is about to be shown.
- __onFailure__: Called if the modal could not be opened. There might be another modal open.
