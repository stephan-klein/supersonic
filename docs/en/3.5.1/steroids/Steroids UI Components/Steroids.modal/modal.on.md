steroids.modal.on
==================

The `steroids.modal.on` method registers a global event listener for a change in modal visibilty states. The following events are available:

## willshow

The `willshow` event is fired when `steroids.modal.show` is called.

## didshow

The `didshow` event is fired when, after `steroids.modal.show` is called, the target modal becomes visible.

## willclose

The `willclose` event is fired when `steroids.modal.hide` is called.

## didclose

The `didclose` event is fired when, after `steroids.modal.hide` is called, the underlying layer becomes visible.

## Example
    var handlerId = steroids.modal.on('didshow', function(event) {
      alert(event.target.webview.location);
    });

## Parameters

- event type: The event type to be listened for, either "willshow", "didshow", "willclose" or "didclose"
- handler function: The callback function to be triggered on the specified event.

## Return value

- handler id: The id of the listener registered.

## The event object

The `event` object received by the callback function has the following properties:

    name: "modalwillshow" / "modaldidshow" / "modalwillclose" / "modaldidclose"
      target:
        webview:
          prefixName: webView
          validEvents: ["created", "preloaded", "unloaded"]
          location: "http://localhost/modal.html"
          id: ""
          params: {}
          allowedRotations: [0]


- `name`: The name of the fired event
- `target`: The modal WebView

The `target` object contains a `webview` object with the following properties:

- `prefixName`: Used internally by `steroids.js`
- `validEvents`: Used internally by `steroids.js`
- `location`: The location of the WebView
- `id`: The id of the WebView
- `params`: Any query parameters included in the WebView location
- `allowedRotations`: An array of allowed rotations


Related
-------

- steroids.modal.off - Unregister a previously set event listener


