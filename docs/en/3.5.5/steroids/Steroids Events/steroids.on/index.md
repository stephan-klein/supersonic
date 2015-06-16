steroids.on
==========

  > Register an event listener for a Steroids-specific event.

The `steroids.on` method registers an event-listener for a Steroids-specific event. The following events are available:

## ready

The `ready` event is fired when `steroids.app` has initialized. You should use it only when you need to access properites of the `steroids.app` object, and when setting a navigation bar tile image with `steroids.view.navigationBar.show`. All other Steroids methods and objects work fine without an event listener (though you should still use the `document` `deviceready` event before making Cordova API calls).

## Example
    steroids.on('ready', function() {
      alert(steroids.app.path);
      alert(steroids.app.absolutePath);
    });
