steroids.drawers.on
==================

The `steroids.drawer.on` method registers a global event listener for a change in drawer visibilty states. The following events are available:

## willshow

The `willshow` event is fired when `steroids.drawers.show` is called.

## didshow

The `didshow` event is fired when, after `steroids.drawers.show` is called, the target drawer becomes visible.

## willclose

The `willclose` event is fired when `steroids.drawers.hide` is called.

## didclose

The `didclose` event is fired when, after `steroids.drawers.hide` is called, the underlying layer becomes visible.

## Example
    var handlerId = steroids.drawers.on('didshow', function(event) {
      alert(event.target.webview.location);
    });

## Parameters

- event type: The event type to be listened for, either "willshow", "didshow", "willclose" or "didclose"
- handler function: The callback function to be triggered on the specified event.

## Return value

- handler id: The id of the listener registered.

## The event object

The `event` object received by the callback function has the following properties:

    name: "drawerwillclose"
    target:
      webview:
        prefixName: webView
        validEvents: ["created", "preloaded", "unloaded"]
        location: "http://localhost/targetView.html"
        id: ""
        params: {}
        allowedRotations: [0]
      drawer:
        edge: steroids.screen.edges.LEFT


- `name`: The name of the fired event
- `target`: The drawer WebView

The `target` object contains a `webview` and a `drawer` object with the following properties:

`webview`:

- `prefixName`: Used internally by `steroids.js`
- `validEvents`: Used internally by `steroids.js`
- `location`: The location of the WebView
- `id`: The id of the WebView
- `params`: Any query parameters included in the WebView location
- `allowedRotations`: An array of allowed rotations

`drawer`:

- `edge`: Specifies which side of the screen is affected


Related
-------

- steroids.drawers.off - Unregister a previously set event listener


