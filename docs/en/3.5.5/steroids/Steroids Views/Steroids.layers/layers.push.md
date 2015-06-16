steroids.layers.push
=================

Adds a `steroids.views.WebView` to the layer stack.

    var googleView = new steroids.views.WebView("http://www.google.com");

    steroids.layers.push(googleView);

Description
-----------

In the default configuration, the new view slides onto the screen from the right edge of the device.  On iOS, steroids.view.navigationBar appears automatically in the next view with the back button on the left. Please note: steroids.layers.push does not show the navigation bar by default on Android. In order to show the navigation bar on Android, you need to call steroids.view.navigationBar.show on the webview.

Full Example
-------------

    var googleView = new steroids.views.WebView( { location: "http://www.google.com" } );

    var myAnimation = new steroids.Animation({
      transition: "curlUp",
      duration: 0.2,
      curve: "easeInOut",
      reversedTransition: "curlDown",
      reversedDuration: 0.4
    });

    steroids.layers.push( {
      view: googleView,
      keepLoading: true,
      navigationBar: false,
      tabBar: false,
      animation: myAnimation
    }, {
      onSuccess: function() {
        alert("The view has been pushed to the layer stack.");
      },
      onFailure: function(error) {
        alert("Could not push the view: " + error.errorDescription);
      }
    });

Parameters
----------


`steroids.layers.push` accepts a single `steroids.views.WebView` object as the parameter.

Alternatively you can provide an options object, which can have the following properties:

- __view__: View to be added. Required.
- __keepLoading__: If set to `true`, then the target view will need to remove [loading.html](http://guides.appgyver.com/steroids/guides/ios/loading-html/)/[loading.png](http://guides.appgyver.com/steroids/guides/android/loading-png/) with steroids.view.removeLoading.
- __navigationBar__: If set to `false`, then steroids.view.navigationBar does not appear automatically (iOS only).
- __tabBar__: If set to `false`, then the native tab bar (if enabled in config/application.coffee), does not appear (iOS only).
- __animation__: A `steroids.Animation` object used for the animation that brings the target view onto the screen (as well as animates it away after it is popped from the layer stack).

Callbacks
---------
- __onSuccess__: Called once the view is about to be pushed.
- __onFailure__: Called if the view could not be pushed.

Supported Platforms
-------------------

- iOS
- Android (Only fade animation supported with duration 1.0 or 0.0 (appear))
