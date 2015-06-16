steroids.drawers.off
====================

Unregister an event listener set with the `steroids.drawers.on` method. 

## Example
    
    steroids.drawers.off("willchange", handlerid);

## Parameters

- event type: The event type that was listened to , i.e. "willshow", "didshow", "willclose" or "didclose".
- handler id: The id of the listener to be unregistered.