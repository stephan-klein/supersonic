steroids.view.updateKeyboard
=================================

Update properties of the native keyboard input for the current WebView. If a property is not present in the options object, it will not be changed.

Quick example
-------------

    steroids.view.updateKeyboard({
      accessoryBarEnabled: false
    });

Full example
------------

    steroids.view.updateKeyboard({
      accessoryBarEnabled: false
    }, {
      onSuccess: function() {
        alert("Keyboard accessory bar disabled for this view!");
      },
      onFailure: function() {
        alert("Could not update keyboard!")
      }
    });

Options
-------

- __accessoryBarEnabled__: Determines if the native keyboard accessory bar (i.e. one with "Prev", "Next", "Done") is shown with the keyboard input. __Required__.

Callbacks
---------

- __onSuccess__: Called once the keyboard has been updated with the given parameters.
- __onFailure__: Invoked if the keyboard could not be updated.

Supported platforms
-------------------
- iOS
