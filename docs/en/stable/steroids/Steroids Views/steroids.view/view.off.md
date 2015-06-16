steroids.view.off
====================

Unregister an event listener set with the `steroids.view.on` method. 

## Example
    
    steroids.view.off("created", handlerid);

## Parameters

- event type: The event type that was listened to, i.e. "created", "preloaded" or "unloaded".
- handler id: The id of the listener to be unregistered.