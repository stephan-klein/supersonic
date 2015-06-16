steroids.view.navigationBar.update
=================

  > Sets/updates the content of native navigation bar of the current view.

  steroids.view.navigationBar.update("New title");



Description
-----------

Sets/updates the navigation bar contents (title, title image and navigation bar buttons) with the ones given as parameters. If `steroids.view.navigationBar.update` is called in a preloaded view, the updated content is displayed, when the view is pushed to the layer stack and comes visible.

Titles longer than the available space on the navigation bar will be truncated by the underlying OS of the device.
The available space for the title depends on device orientation, device type, back button title length and the right button title length.


Full Example
-------------

    var leftButton = new steroids.buttons.NavigationBarButton();
    var rightButton = new steroids.buttons.NavigationBarButton();
    var imageButton = new steroids.buttons.NavigationBarButton();
    var backButton = new steroids.buttons.NavigationBarButton();

    leftButton.title = "Left"
    leftButton.onTap = function() { alert("Left button tapped"); }

    rightButton.title = "Right"
    rightButton.onTap = function() { alert("Right button tapped"); }

    imageButton.imagePath = "/icons/pill@2x.png"
    imageButton.imageAsOriginal = "true"
    imageButton.onTap = function() { alert("Image button tapped"); }

    backButton.title = "Return"

    steroids.view.navigationBar.update({
      titleImagePath: "/icons/telescope@2x.png",
      overrideBackButton: false,
      backButton: backButton,
      buttons: {
        left: [leftButton],
        right: [rightButton, imageButton]
      }
    }, {
      onSuccess: function() {
        alert("Navigation bar updated!");
      },
      onFailure: function() {
        alert("Failed to update the navigation bar.");
      }
    });

Parameters
----------

`steroids.view.navigationBar.update` accepts a single string for the navigation bar title text as the parameter.

Alternatively you can provide an options object, which can have the following properties:

- __title__: Navigation bar title text.
- __titleImagePath__: Path to an image to be shown in the navigation bar. It is relative to the App folder by default (see [App Structure guide](http://guides.appgyver.com/steroids/guides/steroids-js/app-structure-on-device/) for more information). Overrides __title__.
- __overrideBackButton__: If set to `true`, the native back button in the navigation bar will be hidden regardless of buttons. If set to `false`, setting left side buttons will not hide the native back button.
- __backButton__: A steroids.buttons.NavigationBarButton that will be used in place of the native back button.
- __buttons__: an object defining the steroids.buttons.NavigationBarButton objects with which the navigation bar will be updated.
  * __left__: left side buttons as an array.
  * __right__: right side buttons as an array.

Parameters from previous calls to `steroids.views.navigationBar.update` remain in effect, so e.g. updating just the title will leave any buttons as they are.

To set navigation bar title and buttons for the root view of the application (or a tab)
-----------------

Call `steroids.view.navigationBar.show` in the `onSuccess` function of `steroids.view.navigationBar.update` in the root view.

    var leftButton = new steroids.buttons.NavigationBarButton();
    var rightButton = new steroids.buttons.NavigationBarButton();

    leftButton.title = "Left"
    leftButton.onTap = function() { alert("Left button tapped"); }

    rightButton.title = "Right"
    rightButton.onTap = function() { alert("Right button tapped"); }

    steroids.view.navigationBar.update({
      titleImagePath: "/icons/telescope@2x.png",
      overrideBackButton: false,
      buttons: {
        left: [leftButton],
        right: [rightButton]
      }
    }, {
      onSuccess: function() {
        steroids.view.navigationBar.show();
      },
      onFailure: function() {
        alert("Failed to update the navigation bar.");
      }
    });


To remove buttons
-----------------

Set buttons.left and buttons.right to an empty array to remove the buttons on the corresponding side.

    steroids.view.navigationBar.update({
        buttons: {
          left: [],
          right: []
        }
      }, {
      onSuccess: function() {
        alert("all buttons removed");
      },
      onFailure: function(error) {
        alert("failed to remove buttons: " + error.errorDescription);
      }
    });

overrideBackButton known issue
------------------------------

Currently, the initial state of the navigation bar behaves differently from either `overrideBackButton` state. If the  `overrideBackButton` parameter has not been used in any API call, setting any left buttons hides the native back button, whereas removing the left buttons by setting an empty array shows the back button. When `overrideBackButton` is called for a particular view, the behavior changes to its value, and the initial state cannot be returned to.

Callbacks
---------

- __onSuccess__: Called once the navigation bar have been updated.
- __onFailure__: Called if the navigation bar could not be updated. Receives a single `error` parameter. The `error` object has the property `errorDescription` which reveals further details about the error.

Supported Platforms
-------------------

- iOS

