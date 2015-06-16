steroids.app.userFilesPath
=================

  > The string property that contains the user files path is relative to the native application document storage space on device.

    var path = steroids.app.userFilesPath;

This property can be accessed only after the Steroids `ready` event (see steroids.on).

Example
-------

    steroids.on('ready', function() {
      alert(steroids.app.userFilesPath); // on iOS == ""
    });

Supported Platforms
-------------------

- iOS
- Android
