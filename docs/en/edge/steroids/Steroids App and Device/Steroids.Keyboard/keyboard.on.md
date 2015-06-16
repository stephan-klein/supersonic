steroids.keyboard.on
====================

  > Register an event listener for the software keyboard.

The following events are available:

## actionButtonPressed

The `actionButtonPressed` event is fired when the "Go" or "Next" button is pressed on the software keyboard.

## Example

    steroids.keyboard.on('actionButtonPressed', function(params) {
      alert("Keyboard action triggered");
    });