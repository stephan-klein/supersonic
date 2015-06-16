steroids.view.navigationBar.hide
=================

  > Hides the native navigation bar application wide

    steroids.view.navigationBar.hide();

Description
-----------

Removes the native navigation bar and extends the height of the application view application wide (in the current tab, if the tab bar is enabled).

Full Example
-------------

    steroids.view.navigationBar.hide({
      animated: true
    },{
      onSuccess: function() {
        alert("Navigation bar is now removed");
      },
      onFailure: function(error) {
        alert("Navigation bar could not be removed: " + error.errorDescription);
      }
    });

Parameters
----------
- __animated__ (iOS Only): when set to `true`, navigation bar is hidden with an animation.


Callbacks
---------
- __onSuccess__: Called once the navigation bar has been removed.
- __onFailure__: Called if the navigation bar could not be removed. Receives a single `error` parameter. The `error` object has the property `errorDescription` which reveals further detail about the error.


Supported Platforms
-------------------

- iOS
- Android
