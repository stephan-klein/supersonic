steroids.app.path
=================

  > The string property that contains the application path is relative to the native application document storage space on the device.

    var path = steroids.app.path;

The path of the folder that contains the application's files (i.e. the contents of the `dist/` folder) changes every time you reload the app in AppGyver Scanner. This is done to clear all cache that the WebKit engine might have set.

This property can be accessed only after the Steroids `ready` event (see steroids.on).

Note that the application folder is read-only. For saving data on the device, use steroids.app.userFilesPath instead.

** Please use rather steroids.app.absolutePath as it works also on Android. **

Example
-------

    steroids.on('ready', function() {
      alert(steroids.app.path); // on iOS ~= "applications/local/123456789"
    });

Supported Platforms
-------------------

- iOS
