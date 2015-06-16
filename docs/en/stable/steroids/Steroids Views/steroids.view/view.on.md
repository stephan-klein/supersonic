steroids.view.on
==================

The `steroids.view.on` method registers a *global* event listener that tracks the creating and load status of WebViews. The following events are available:

## created

The `created` event is fired when the `steroids.views.WebView` constructor is called. 

## preloaded

The `preloaded` event is fired when a `steroids.views.WebView` is preloaded.

## unloaded

The `unloaded` event is fired when a `steroids.views.WebView` is unloaded.


## Example
    var handlerId = steroids.view.on('preloaded', function(event) {
      alert(event.webview.location);
    });

## Parameters

- event type: The event type to be listened for, i.e "created", "preloaded" or "unloaded"
- handler function: The callback function to be triggered on the specified event. 

## Return value

- handler id: The id of the listener registered.

## The event object

The `event` object received by the callback function has the following properties:
   
    name: "webviewcreated"
    webview:
      prefixName: webView
      validEvents: ["created", "preloaded", "unloaded"]
      location: "http://localhost/modal.html"
      id: ""
      params: {}
      allowedRotations: [0]   


- `name`: The name of the fired event
- `webview`: The affected WebView

The `webview` object has the following properties:

- `prefixName`: Used internally by `steroids.js`
- `validEvents`: Used internally by `steroids.js`
- `location`: The location of the WebView
- `id`: The id of the WebView
- `params`: Any query parameters included in the WebView location
- `allowedRotations`: An array of allowed rotations


Related
-------

- steroids.view.off - Unregister a previously set event listener


