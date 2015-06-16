steroids.modal.off
==================

Unregister an event listener set with the `steroids.modal.on` method. 

## Example
    
    steroids.modal.off("willchange", handlerid);

## Parameters

- event type: The event type that was listened to , i.e. "willshow", "didshow", "willclose" or "didclose".
- handler id: The id of the listener to be unregistered.