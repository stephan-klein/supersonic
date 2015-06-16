steroids.layers.pop
=================

Removes the topmost view from the navigation stack.

    steroids.layers.pop();

Description
-----------

Equal to pressing the native back button on the left side of the native navigation bar (See `steroids.view.navigationBar`).

Full Example
-------------

    steroids.layers.pop({}, {
      onSuccess: function() {
        alert("Topmost layer has been removed navigation tree.");
      },
      onFailure: function(error) {
        alert("Could not remove a layer: " + error.errorDescription);
      }
    });

Parameters
----------

None.

Callbacks
---------
- __onSuccess__: Called once the layer is starting to be removed.
- __onFailure__: Called if the layer could not be removed. There might not be any layers left to remove.

Supported Platforms
-------------------

- iOS
- Android
