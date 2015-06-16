steroids.layers.on
==================

The `steroids.layers.on` method registers a global event listener for a change event in the Steroids layer stack. The following events are available:

## willchange

The `willchange` event is fired when either a `steroids.layers.push` or `steroids.layers.pop` is initiated.

## didchange

The `didchange` event is fired when, following a `steroids.layers.push` or `steroids.layers.pop`, the target layer becomes visible.

## Example
    var handlerId = steroids.layers.on('didchange', function(event) {
      alert("Source location: " + event.source.webview.location + "\n" +
            "Target location: " + event.target.webview.location);
    });

## Parameters

- event type: The event type to be listened for, either "willchange" or "didchange"
- handler function: The callback function to be triggered on the specified event.

## Return value

- handler id: The id of the listener registered.

## The event object

The `event` object received by the callback function has the following properties:

    name: "layerwillchange" / "layerdidChange"
    target:
      webview:
        prefixName: webView
        validEvents: ["created", "preloaded", "unloaded"]
        location: "http://localhost/targetView.html"
        id: ""
        params: {}
        allowedRotations: [0]
    source:
      webView:
        prefixName: webView
        validEvents: ["created", "preloaded", "unloaded"]
        location: "http://localhost/sourceView.html"
        id: ""
        params: {}
        allowedRotations: [0]

- `name`: The name of the fired event
- `target`: The WebView that is visible at the end of the layer change
- `source`: The WebView that is visible at the start of the layer change

The WebView objects in `target` and `source` contain the following properties:

- `prefixName`: Used internally by `steroids.js`
- `validEvents`: Used internally by `steroids.js`
- `location`: The location of the WebView
- `id`: The id of the WebView
- `params`: Any query parameters included in the WebView location
- `allowedRotations`: An array of allowed rotations

Related
-------

- steroids.layers.off - Unregister a previously set event listener


