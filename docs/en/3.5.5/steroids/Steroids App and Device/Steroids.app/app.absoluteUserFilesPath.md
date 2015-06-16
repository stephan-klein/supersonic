steroids.app.absoluteUserFilesPath
=========================

  > String property that contains the absolute user files folder path inside the device filesystem.

    steroids.app.absoluteUserFilesPath;

Description
-----------

The absolute path of the user files folder changes every time you reload the app in AppGyver Scanner. This is done to clear all cache that the WebKit engine might have set.

When the full path to a file is needed, the user files folder's current path needs to be read from this property each time the application starts. This property can be accessed only after the Steroids `ready` event (see steroids.on).

Example
-------

    steroids.on('ready', function() {
      alert(steroids.app.absoluteUserFilesPath) // on iOS ~= "/var/mobile/Applications/AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA/Scanner.app/Documents"
    });


Supported Platforms
-------------------

- iOS
- Android
