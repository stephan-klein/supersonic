steroids.openURL
================

  > Launches external programs

    steroids.openURL("http://www.google.com");
    steroids.openURL("otherapp://?foo=1&bar=2");

Description
-----------

Launches browser to open the URL or any external application with that applications URL scheme.

Full Example
-------------

    steroids.openURL({
      url: "maps://"
    },{
      onSuccess: function(parameters) {
        alert("Maps launched");
      },
      onFailure: function(error) {
        alert("Failed to open: " + error.errorDescription);
      }
    });

Parameters
----------

- __url__: URL to open. URLs starting with "http(s)://" will be opened in the device's browser.


Callbacks
---------

- __onSuccess__: Called once the application has launched.
- __onFailure__: Called if the URL could not be opened.

Supported Platforms
-------------------

- iOS, Android
