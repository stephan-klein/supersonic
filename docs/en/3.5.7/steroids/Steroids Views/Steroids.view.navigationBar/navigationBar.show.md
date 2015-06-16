steroids.view.navigationBar.show
=================

  > Shows a native navigation bar application wide

    steroids.view.navigationBar.show();

Related Guides
--------------

* [App Structure on the Device](http://guides.appgyver.com/steroids/guides/steroids-js/app-structure-on-device/)

Description
-----------

Shows a native navigation bar application wide (in the current tab if the tab bar is enabled). Showing the navigation bar reduces the height of the application.

__Note__: While the navigation bar title can be set with `steroids.view.navigationBar.show` using the `title` parameter, it is recommended to use `steroids.navigationBar.update` for setting the navigation bar title on iOS.

Full Example
-------------

    steroids.view.navigationBar.show({
      title: "My View Title",
      animated: true
    },{
      onSuccess: function() {
        alert("Navigation bar is now visible");
      },
      onFailure: function(error) {
        alert("Navigation bar could not be shown: " + error.errorDescription);
      }
    });


    // image file is in 'steroids.app.absoluteUserFilesPath + "/downloads/navbar.png"'
    steroids.view.navigationBar.show({
      titleImagePath: "navbar.png",
      relativeTo: "downloads"
    });

Parameters
----------

- __title__: Text visible in the center of the navigation bar. Overrides __titleImagePath__.
- __titleImagePath__ (iOS only): Path to an image to be shown in the navigation bar. It is relative to the App folder by default (see [App Structure guide](http://guides.appgyver.com/steroids/guides/steroids-js/app-structure-on-device/) for more information).
- __relativeTo__ (iOS only): Set the relative path for __titleImagePath__, from the root of steroids.app.absoluteUserFilesPath.
- __animated__ (iOS Only): when set to `true`, navigation bar is shown with an animation.

Callbacks
---------

- __onSuccess__: Called once the navigation bar has been shown.
- __onFailure__: Invoked if the navigation bar could not be shown. Receives a single `error` parameter. The `error` object has the property `errorDescription` which reveals further details about the error.


Supported Platforms
-------------------

- iOS
- Android
