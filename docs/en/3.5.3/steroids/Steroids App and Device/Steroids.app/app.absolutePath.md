steroids.app.absolutePath
=========================

  > String property that contains the absolute application path inside the device filesystem.

    steroids.app.absolutePath;

Description
-----------

The absolute path of the folder that contains the application's files (i.e. the contents of the `dist/` folder) changes every time you reload the app in AppGyver Scanner. This is done to clear all cache that the WebKit engine might have set.

When the full path to a file is needed, the application's current path needs to be read from this property each time the application starts. This property can be accessed only after the Steroids `ready` event (see steroids.on).

Note that the application folder is read-only. For saving data on the device, use steroids.app.absoluteUserFilesPath instead.

Example
-------

    steroids.on('ready', function() {
      alert(steroids.app.absolutePath) // on iOS ~= "/var/mobile/Applications/AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA/Scanner.app/Documents/applications/local/123456789"
    });


Supported Platforms
-------------------

- iOS
- Android