steroids.layers.replace
=================

Replace the current layer stack with a preloaded `steroids.views.WebView`.

    var googleView = new steroids.views.WebView("http://www.google.com");

    googleView.preload({},{
      onSuccess: function() {
        steroids.layers.replace(googleView);
      }
    };


Description
-----------

Removes all pushed layers from the stack and replaces the root `steroids.views.WebView` view with the given view. The target WebView must be preloaded with `steroids.views.WebView.preload` to be used with `replace()`.

Full Example
-------------

    var googleView = new steroids.views.WebView( { location: "http://www.google.com" } );
    googleView.preload({},{
      onSuccess: replaceLayer
    });

    function replaceLayer() {
      steroids.layers.replace( {
        view: googleView,
      }, {
        onSuccess: function() {
          alert("The layer stack has been replaced.");
        },
        onFailure: function(error) {
          alert("Could not replace the layer stack: " + error.errorDescription);
        }
      });
    }

Parameters
----------
As a convenience shortcut, you can simply call `steroids.layers.replace` with a single preloaded `steroids.views.WebView` object as the parameter.

Otherwise, you should use an options object, which has the following parameters:

- __view__: View to be added. Required.

Replacing to the initial view
-----------------------------

The initial view has a preload ID on the native side that is identical to it's `location` property set in `config/application.coffee`. Thus, if you have `steroids.config.location = "index.html"`, you would use `replace()` to go back to the root view by running the following code:

    var rootView = new steroids.views.WebView( { location: "index.html", id: "index.html" } );
    steroids.layers.replace(rootView);

If you are using tabs, each tab's initial view has a preload ID that matches the corresponding tab object's `location` property.

Callbacks
---------
- __onSuccess__: Called once the layer stack has been replaced.
- __onFailure__: Called if the layer stack could not be replaced.

Supported Platforms
-------------------

- iOS
