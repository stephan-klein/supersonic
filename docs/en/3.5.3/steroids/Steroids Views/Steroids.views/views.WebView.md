steroids.views.WebView
========================

  > Represents a single webview.

    var googleLayer = new steroids.views.WebView("http://www.google.com");

## Description

A `steroids.views.WebView` can be used as a modal window with steroids.modal or with steroids.layers.push.


## Full Example

    var googleView = new steroids.views.WebView({
      location: "http://www.google.com?test=1",
      id: "search"
    });

    googleView.location // == "http://www.google.com?test=1"
    googleView.params.test // == "1"

## Constructor

    new steroids.views.WebView(webviewOptions)

### webviewOptions

- __location__: path or URL to be the window.location of the layer. __Required__.
- __id__: a unique id for the WebView. __Optional__.


## Properties

    webView.params.test // == "1"

- __params__: An object representation of the query string of `location` property.

steroids.views.WebView.prototype.preload
=======

Any `steroids.views.WebView` can be preloaded. Preloaded views are displayed faster than non-preloaded views.  See visibilitychange for related events.

Preloaded WebViews are accessed based on their id, which by default is the same as their location, but the id can be declared explicitly.

The success callback is fired when the native side has initialized the WebView to the point where it can be pushed to the layer stack with steroids.layers.push. This doesn't ensure anything about the HTML document's state itself, e.g. `DOMContentLoaded` event or similar.

See the [preload guide](http://guides.appgyver.com/steroids/guides/steroids-js/using-preloaded-webviews/) for more information.

### Full example

    var googleView = new steroids.views.WebView({
      location: "http://www.google.com"
    });

    googleView.preload({id: "search"}, {
      onSuccess: function() {
        alert("View has been loaded in the background and is ready to be pushed to the layer stack");
      },
      onFailure: function() {
        alert("Failed to preload.")
      }
    });

### Properties

- __id__: a unique id for the preloaded WebView. __Optional__.

steroids.views.WebView.prototype.unload (iOS only)
=======

A preloaded webview can be unloaded. Unloading a WebView object removes it from memory.

### Full example

    var googleView = new steroids.views.WebView({
      location: "http://www.google.com",
      id: "search"
    });

    googleView.unload({}, {
      onSuccess: function() {
        alert("View has been unloaded.");
      },
      onFailure: function() {
        alert("Failed to unload.")
      }
    });

Related
-------
 - steroids.view - The current steroids.views.WebView can be accessed by `steroids.view`
 - visibilitychange - Event for the changes in the on-screen visibility of the view.
