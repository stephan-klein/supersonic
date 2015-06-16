steroids.screen.on
==================

The `steroids.screen.on` method registers a global event listener for a change event in the Steroids screen class. The following events are available:

## alertdidshow

The `alertdidshow` event is fired when an alert is shown on screen.

## Example
    //detect and dismiss an on-screen alert

    var handlerId = steroids.screen.on('alertdidshow', function(event) {
      steroids.screen.dismissAlert({buttonIndex: 0})
    });

## Parameters

- event type: The event type to be listened for, i.e. "alertdidshow"
- handler function: The callback function to be triggered on the specified event.

## Return value

- handler id: The id of the listener registered.

## The event object

The `event` object received by the callback function has the following properties:

    title: "Alert"
    name: "screenalertdidshow"

- `title`: the title of the event
- `name`: The name of the fired event

Related
-------

- steroids.screen.off - Unregister a previously set event listener


