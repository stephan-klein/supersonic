steroids.tabBar.on
==================

The `steroids.tabBar.on` method registers a global event listener for a change in the native tab bar. The following events are available:

## willchange

The `willchange` event is fired when a tab change is initiated (via `steroids.tabBar.selectTab` or the user tapping another tab).

## didchange

The `didchange` event is fired when, following a tab change (via `steroids.tabBar.selectTab` or the user tapping another tab), the target tab becomes visible.

## Example
    var handlerId = steroids.tabBar.on('didchange', function(event) {
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

    name: "tabwillchange" / "tabdidchange"
    target:
      webview:
        prefixName: webView
        validEvents: ["created", "preloaded", "unloaded"]
        location: "http://localhost/targetView.html"
        params: {}
        allowedRotations: [0]
      tab:
        index: 1
        title: "targetTabTitle"
    source:
      webview:
        prefixName: webView
        validEvents: ["created", "preloaded", "unloaded"]
        location: "http://localhost/targetView.html"
        id: ""
        params: {}
        allowedRotations: [0]
      tab:
        index: 0
        title: "sourceTabTitle"


- `name`: The name of the fired event
- `target`: The WebView that is visible at the end of the tab change
- `source`: The WebView that is visible at the start of the tab change

The `target` and `source` objects contain a `webview` object and a `tab` object, which have the following properties:

`webview`:

- `prefixName`: Used internally by `steroids.js`
- `validEvents`: Used internally by `steroids.js`
- `location`: The location of the WebView
- `id`: The id of the WebView
- `params`: Any query parameters included in the WebView location
- `allowedRotations`: An array of allowed rotations

`tab`:

- `index`: The index of the tab
- `title`: The title of the tab

Related
-------

- steroids.tabBar.off - Unregister a previously set event listener


