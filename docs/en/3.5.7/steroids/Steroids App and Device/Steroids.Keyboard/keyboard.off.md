steroids.keyboard.off
====================

  > Remove a previously attached event listener for the software keyboard.

## Example
    var eventHandler = steroids.keyboard.on('actionButtonPressed', function(params) {
      alert("Keyboard action triggered");
    });

    // keyboard.off with the handler id

    steroids.keyboard.off("actionButtonPressed", eventHandler)

    // keyboard.off with event name

    steroids.keyboard.off("actionButtonPressed")