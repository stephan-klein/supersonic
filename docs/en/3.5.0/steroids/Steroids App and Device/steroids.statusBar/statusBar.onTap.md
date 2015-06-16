steroids.statusBar.onTap
========================

  > Executes a function when the status bar is tapped

    steroids.statusBar.onTap(
      function() {
        alert("Status bar tapped!");
      }
    );

Description
-----------

Registers an event listener for tapping the status bar. The function given as a parameter will be fired when the status bar is tapped.

### Full example

    steroids.statusBar.onTap(
      function() {
        alert("Status bar tapped!");
      }, {
        onSuccess: "Status bar tap event listener added!",
        onFailure: "Could not set up status bar tap event listener."
      }
    );

Known issues
------------
Calling steroids.statusBar.onTap sets the status bar style to dark and makes steroids.statusBar.show and steroids.statusBar.hide not function (even though they fire their success callback). This behavior persists until the app is restarted.

The `onTap` event listener persists for a while after a WebView is popped, which can lead to inconsistent behavior. You can hack around this by setting and unsetting (set to an empty function) the `onTap` event listener according to the WebView visibility with the visibilitychange event listener.

Parameters
----------
- __onTap__. A function that gets executed when the status bar is tapped. _Required._

Callbacks
---------
- __onSuccess__: Called once the status bar has been hidden.
- __onFailure__: Invoked if the status bar could not be hidden.

Supported Platforms
-------------------

- iOS
